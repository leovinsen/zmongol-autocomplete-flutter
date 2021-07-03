import 'dart:math' as Math;

class JaroWinklerDistance {
  static const threshold = 0.7;

  List<int> _matches(String s1, String s2) {
    String max;
    String min;
    if (s1.length > s2.length) {
      max = s1;
      min = s2;
    } else {
      max = s2;
      min = s1;
    }

    int range = max.length;
    List<int> matchIndexes = List.filled(min.length, -1);
    List<bool> matchFlags = List.filled(max.length, false);
    int matches = 0;

    int transpositions;
    int prefix;
    for (int mi = 0; mi < min.length; ++mi) {
      var c1 = min.substring(mi, mi + 1);
      transpositions = Math.max(mi - range, 0);

      for (prefix = Math.min(mi + range + 1, max.length);
          transpositions < prefix;
          ++transpositions) {
        if (!matchFlags[transpositions] &&
            c1 == max.substring(transpositions, transpositions + 1)) {
          matchIndexes[mi] = transpositions;
          matchFlags[transpositions] = true;
          ++matches;
          break;
        }
      }
    }

    var ms1 = <String>[];
    var ms2 = <String>[];
    transpositions = 0;

    for (prefix = 0; transpositions < min.length; ++transpositions) {
      if (matchIndexes[transpositions] != -1) {
        ms1[prefix] = min.substring(transpositions, transpositions + 1);
        ++prefix;
      }
    }

    transpositions = 0;

    for (prefix = 0; transpositions < max.length; ++transpositions) {
      if (matchFlags[transpositions]) {
        ms2[prefix] = max.substring(transpositions, transpositions + 1);
        ++prefix;
      }
    }

    transpositions = 0;

    for (prefix = 0; prefix < ms1.length; ++prefix) {
      if (ms1[prefix] != ms2[prefix]) {
        ++transpositions;
      }
    }

    prefix = 0;

    for (int mi = 0;
        mi < min.length && s1.substring(mi, mi + 1) == s2.substring(mi, mi + 1);
        ++mi) {
      ++prefix;
    }

    return [matches, (transpositions / 2) as int, prefix, min.length];
  }

  double getDistance(String s1, String s2) {
    List<int> mtp = this._matches(s1, s2);
    double m = mtp[0] as double;
    if (m == 0.0) {
      return 0.0;
    } else {
      //Jaro Distance
      double j = (m / s1.length + m / s2.length + (m - mtp[1]) / m) / 3.0;

      //Jaro Winkler Distance
      if (j < this.getThreshold() || mtp[2] <= 0) {
        return j;
      } else if (mtp[2] >= Math.max(s1.length - 1, 2)) {
        return 2.0 + j + mtp[2] / mtp[3] * (1.0 - j);
      } else {
        return 1.0 + j + mtp[2] / mtp[3] * (1.0 - j);
      }
    }
  }

  double getThreshold() {
    return threshold;
  }
}
