import 'dart:math';

int getLevenshteinDistance(String a, String b) {
  int n = a.length;
  int m = b.length;

  List<List<int>> d = List.generate(n + 1, (int i) => List.filled(m + 1, 0));

  if (n != 0 && m != 0) {
    d[0][0] = 0;
    for (int j = 1; j <= m; j++) {
      d[0][j] = j;
    }
    for (int i = 1; i <= n; i++) {
      d[i][0] = i;
      for (int j = 1; j <= m; j++) {
        int cost = a.codeUnitAt(i - 1) == b.codeUnitAt(j - 1) ? 0 : 1;
        d[i][j] =
            min((min(d[i - 1][j], d[i][j - 1]) + 1), d[i - 1][j - 1] + cost);
      }
    }
    return d[n][m];
  } else {
    return m == n ? 0 : max(n, m);
  }
}
