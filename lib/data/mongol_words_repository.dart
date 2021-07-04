import 'package:ime_mongol_package/data/db_provider.dart';
import 'package:ime_mongol_package/model/word_entity.dart';
import 'package:sqflite/sqflite.dart';

class MongolWordsRepository {
  final _tableName = "word";

  Database _getDb() {
    return DbProvider.instance.db;
  }

  /// Query words with where clause of:
  /// WHERE length = ? AND frequency > ?
  Future<List<WordEntity>> queryWordsByLengthAndGtFrequency(
      {required int length, required int frequency}) async {
    List<Map<String, dynamic>> list = await _getDb().query(
      'word',
      where: '"length" = ? AND "frequency" > ?',
      whereArgs: [length, frequency],
    );
    return list.map((row) => WordEntity.fromMap(row)).toList();
  }

  Future<int> queryMaxLengthByFrequency(int frequency) async {
    List<Map<String, dynamic>> list = await _getDb().rawQuery(
        "SELECT MAX(length) AS maxLength FROM $_tableName WHERE frequency > ?",
        [frequency]);
    return list[0]['maxLength'];
  }
}
