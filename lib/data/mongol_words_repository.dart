import 'dart:io';

import 'package:ime_mongol_package/word_entity.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

import '../algorithm/burhard_keller_tree.dart';

class MongolWordsRepository {
  static const FREQUENCY_BOUND = 6;
  static const ROOT_STRING = "ᡥᡪᡱᡪᢝ";

  final _dbFilepath = "mongol_words.db";
  final _tableName = "word";
  final _pageSize = 1000;
  final _lengthKeyBkMap = Map<int, BurkhardKellerTree>();

  late Database _db;

  Future<void> initialize() async {
    await _openDatabase();
    await _loadWordsIntoMemory();
  }

  Future<void> _openDatabase() async {
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

  Future<void> _loadWordsIntoMemory() async {
    int maxLength = await _queryMaxLengthByFrequency(FREQUENCY_BOUND - 1);

    int page = 1;
    int totalRecords = 0;
    while (maxLength > 0) {
      BurkhardKellerTree? bkTree = _lengthKeyBkMap[maxLength];
      if (bkTree == null) {
        bkTree = new BurkhardKellerTree(new WordEntity.fromString(ROOT_STRING));
        _lengthKeyBkMap[maxLength] = bkTree;
      }
      BurkhardKellerTree bk = bkTree;
      int curLength = maxLength;
      List<WordEntity> wordEntityList = await _queryWordsByLengthAndGtFrequency(
        length: curLength,
        frequency: 45,
        pageSize: _pageSize,
        page: page - 1,
      );

      totalRecords += wordEntityList.length;
      bk.addAll(wordEntityList);
      maxLength--;
      page++;
    }

    print('totalRecords :$totalRecords');
  }

  /// Query words with where clause of:
  /// WHERE length = ? AND frequency > ?
  Future<List<WordEntity>> _queryWordsByLengthAndGtFrequency(
      {required int length,
      required int frequency,
      required int pageSize,
      required int page}) async {
    List<Map<String, dynamic>> list = await _db.query(
      'word',
      where: '"length" = ? AND "frequency" > ?',
      whereArgs: [length, frequency],
    );
    return list.map((row) => WordEntity.fromMap(row)).toList();
  }

  Future<int> _queryMaxLengthByFrequency(int frequency) async {
    List<Map<String, dynamic>> list = await _db.rawQuery(
        "SELECT MAX(length) AS maxLength FROM $_tableName WHERE frequency > ?",
        [frequency]);
    return list[0]['maxLength'];
  }
}
