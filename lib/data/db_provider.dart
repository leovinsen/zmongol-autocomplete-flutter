import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class DbProvider {
  DbProvider._privateConstructor();

  static final DbProvider instance = DbProvider._privateConstructor();

  final _dbFilepath = "mongol_words.db";

  late Database _db;

  Database get db => _db;

  Future<void> initialize() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _dbFilepath);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Initializing Mongolian Words DB for the first time");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle
          .load(join("packages/ime_mongol_package/lib/assets", _dbFilepath));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening Mongolian Words DB");
    }

    // open the database
    _db = await openDatabase(path, readOnly: true);
  }
}
