import 'dart:math' as math;

class JaroWinklerDistance {
  static const threshold = 0.7;

  List<int> _matches(String s1, String s2) {
    String strMax;
    String strMin;

    if (s1.length > s2.length) {
      strMax = s1;
      strMin = s2;
    } else {
      strMax = s2;
      strMin = s1;
    }

    int range = strMax.length;
    List<int> matchIndexes = List.filled(strMin.length, -1);
    List<bool> matchFlags = List.filled(strMax.length, false);
    int matches = 0;

    int transpositions;
    int prefix;
    for (int mi = 0; mi < strMin.length; ++mi) {
      var c1 = strMin.codeUnitAt(mi);

      transpositions = math.max(mi - range, 0);

      for (prefix = math.min(mi + range + 1, strMax.length);
          transpositions < prefix;
          ++transpositions) {
        if (!matchFlags[transpositions] &&
            c1 == strMax.codeUnitAt(transpositions)) {
          matchIndexes[mi] = transpositions;
          matchFlags[transpositions] = true;
          ++matches;
          break;
        }
      }
    }

    var ms1 = <int>[];
    var ms2 = <int>[];
    transpositions = 0;

    for (prefix = 0; transpositions < strMin.length; ++transpositions) {
      if (matchIndexes[transpositions] != -1) {
        ms1.insert(prefix, strMin.codeUnitAt(transpositions));
        ++prefix;
      }
    }

    transpositions = 0;

    for (prefix = 0; transpositions < strMax.length; ++transpositions) {
      if (matchFlags[transpositions]) {
        ms2.insert(prefix, strMax.codeUnitAt(transpositions));
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
        mi < strMin.length && s1.codeUnitAt(mi) == s2.codeUnitAt(mi);
        ++mi) {
      ++prefix;
    }

    return [matches, (transpositions / 2).floor(), prefix, strMin.length];
  }

  double getDistance(String s1, String s2) {
    List<int> mtp = this._matches(s1, s2);
    double m = mtp[0].toDouble();
    if (m == 0.0) {
      return 0.0;
    } else {
      //Jaro Distance
      double j = (m / s1.length + m / s2.length + (m - mtp[1]) / m) / 3.0;

      //Jaro Winkler Distance
      if (j < threshold || mtp[2] <= 0) {
        return j;
      } else if (mtp[2] >= math.max(s1.length - 1, 2)) {
        return 2.0 + j + mtp[2] / mtp[3] * (1.0 - j);
      } else {
        return 1.0 + j + mtp[2] / mtp[3] * (1.0 - j);
      }
    }
  }
}
