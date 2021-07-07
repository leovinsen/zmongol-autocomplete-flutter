import 'dart:async';

import 'package:async_task/async_task.dart';
import 'package:ime_mongol_package/algorithm/burhard_keller_tree.dart';
import 'package:ime_mongol_package/algorithm/score_marker.dart';
import 'package:ime_mongol_package/filter/key_filter.dart';
import 'package:ime_mongol_package/model/string_distance_info.dart';
import 'package:ime_mongol_package/model/suggest_word.dart';
import 'package:ime_mongol_package/model/word_entity.dart';

class BKTreeMatcher extends AsyncTask<String, List<SuggestWord>> {
  final String word;
  late KeyFilter? filter;
  final SharedData<Map<int, BurkhardKellerTree>, Map<int, BurkhardKellerTree>>
      bkTreeData;

  BKTreeMatcher(this.word, this.bkTreeData);

  @override
  AsyncTask<String, List<SuggestWord>> instantiate(String parameters,
      [Map<String, SharedData>? sharedData]) {
    return BKTreeMatcher(
        parameters,
        sharedData!['bkTree'] as SharedData<Map<int, BurkhardKellerTree>,
            Map<int, BurkhardKellerTree>>);
  }

  @override
  String parameters() {
    return word;
  }

  @override
  Map<String, SharedData>? sharedData() {
    return {'bkTree': this.bkTreeData};
  }

  // Loads the `SharedData` from `serial` for each key.
  @override
  SharedData<Map<int, BurkhardKellerTree>, Map<int, BurkhardKellerTree>>
      loadSharedData(String key, dynamic serial) {
    switch (key) {
      case 'bkTree':
        return SharedData<Map<int, BurkhardKellerTree>,
            Map<int, BurkhardKellerTree>>(serial);
      default:
        throw StateError('Unknown key: $key');
    }
  }

  @override
  FutureOr<List<SuggestWord>> run() {
    return matchInBkMaps(this.word);
  }

  List<SuggestWord> matchInBkMaps(String str) {
    int length = str.length;
    ScoreMarker scoreMarker = new ScoreMarker(str);

    final bkTree = this.bkTreeData.data;

    for (int keyLength in bkTree.keys) {
      if (keyLength >= length && keyLength < length * 2) {
        List<StringDistanceInfo> partMatched =
            bkTree[keyLength]!.matching(str, keyLength - length);
        if (partMatched.isEmpty) {
          continue;
        }
        for (StringDistanceInfo info in partMatched) {
          WordEntity we = info.getMountObject() as WordEntity;
          scoreMarker.setMaxFrequency(we.frequency);
          SuggestWord sw = new SuggestWord(
              we.str, we.length, we.frequency, info.getDistance());
          scoreMarker.add(sw);
        }
      }
    }

    var time2 = DateTime.now().millisecondsSinceEpoch;
    scoreMarker.markAndFilter();

    // print('isolate for $str, runtime: ${time2 - time1} ms');
    return scoreMarker.getSuggestWordList();
  }
}
