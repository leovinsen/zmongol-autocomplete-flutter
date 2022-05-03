import 'package:ime_mongol_package/algorithm/burhard_keller_tree.dart';
import 'package:ime_mongol_package/algorithm/score_marker.dart';
import 'package:ime_mongol_package/model/string_distance_info.dart';
import 'package:ime_mongol_package/model/suggest_word.dart';
import 'package:ime_mongol_package/model/word_entity.dart';

Iterable<SuggestWord> matchInBkMaps(
  Map<int, BurkhardKellerTree> bkTree,
  String str,
) {
  int n = str.length;
  ScoreMarker scoreMarker = ScoreMarker(str);

  for (int keyLength in bkTree.keys) {
    if (keyLength >= n && keyLength < n * 2) {
      List<StringDistanceInfo> partMatched =
          bkTree[keyLength]!.matching(str, keyLength - n);
      if (partMatched.isEmpty) {
        continue;
      }
      for (StringDistanceInfo info in partMatched) {
        WordEntity we = info.getMountObject() as WordEntity;
        scoreMarker.setMaxFrequency(we.frequency);
        SuggestWord sw =
            SuggestWord(we.str, we.length, we.frequency, info.getDistance());
        scoreMarker.add(sw);
      }
    }
  }

  return scoreMarker.markAndFilter();
}
