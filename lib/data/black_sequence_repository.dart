import 'package:ime_mongol_package/data/db_provider.dart';
import 'package:ime_mongol_package/model/black_sequence.dart';
import 'package:sqflite/sqflite.dart';

class BlackSequenceRepository {
  final _tableName = "black_sequence";

  Database _getDb() {
    return DbProvider.instance.db;
  }

  ///Query all black sequences
  Future<List<BlackSequence>> queryAll() async {
    List<Map<String, dynamic>> list = await _getDb().query(
      _tableName,
    );
    return list.map((row) => BlackSequence.fromMap(row)).toList();
  }

  Future<void> insertAll(List<String> blackSequences) async {
    var batch = _getDb().batch();
    blackSequences.forEach(
        (blackSequence) => batch.insert(_tableName, {'str': blackSequence}));

    await batch.commit(noResult: true);
  }
}
