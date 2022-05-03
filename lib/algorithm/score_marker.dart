import 'package:ime_mongol_package/model/suggest_word.dart';

import 'jaro_winkler_distance.dart';

class ScoreMarker {
  static const frequencyThreshold = 0.15;

  static const levenshteinThreshold = 0.50;

  static const jaroWinklerThreshold = 1;

  final List<SuggestWord> suggestWordList = <SuggestWord>[];

  final jaroWinklerDistance = new JaroWinklerDistance();

  final String str;

  int _maxFrequency = 0;

  int get maxFrequency => _maxFrequency;

  set maxFrequency(int maxFrequency) {
    if (this._maxFrequency < maxFrequency) {
      this._maxFrequency = maxFrequency;
    }
  }

  ScoreMarker(this.str);

  void add(final SuggestWord suggestWord) {
    suggestWordList.add(suggestWord);
  }

  void setMaxFrequency(int maxFrequency) {
    if (this._maxFrequency < maxFrequency) {
      this._maxFrequency = maxFrequency;
    }
  }

  Iterable<SuggestWord> markAndFilter() {
    double maxLength = 0;
    for (SuggestWord sw in suggestWordList) {
      if (maxLength < sw.length) {
        maxLength = sw.length.toDouble();
      }
    }

    double maxScore = frequencyThreshold +
        jaroWinklerThreshold * jaroWinklerDistance.getDistance(str, str) +
        _computeLevenshteinScore(str.length, 0, maxLength) *
            levenshteinThreshold;

    // suggestWordList.where((element) => );
    // Filter words by jaroWinkler score

    return suggestWordList.where((sw) {
      sw.levenshteinScore =
          _computeLevenshteinScore(sw.length, sw.levenshteinD, maxLength);
      sw.jaroWinklerScore = jaroWinklerDistance.getDistance(str, sw.str);

      if (sw.jaroWinklerScore < 1) {
        return false;
      }
      sw.frequencyScore = (sw.frequency / maxFrequency);
      sw.score = sw.frequencyScore * frequencyThreshold +
          sw.jaroWinklerScore * jaroWinklerThreshold +
          sw.levenshteinScore * levenshteinThreshold;

      sw.score = sw.score / maxScore;

      return true;
    });
  }

  double _computeLevenshteinScore(
    int length,
    int levenshteinDistance,
    double maxLength,
  ) {
    return 1.0 - ((length / 2 + levenshteinDistance) / (1.5 * maxLength));
  }
}
