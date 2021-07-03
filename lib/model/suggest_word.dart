import 'mount_object.dart';

class SuggestWord implements MountObject {
  final String str;
  final int length;
  final int frequency;
  final int levenshteinD;

  double _jaroWinklerScore = 0;
  double _frequencyScore = 0;
  double _levenshteinScore = 0;
  double _score = 0;

  SuggestWord(this.str, this.length, this.frequency, this.levenshteinD);

  double get jaroWinklerScore => this._jaroWinklerScore;
  double get frequencyScore => this._frequencyScore;
  double get levenshteinScore => this._levenshteinScore;
  double get score => this._score;

  void set jaroWinklerScore(double jaroWinkler) {
    this._jaroWinklerScore = jaroWinkler;
  }

  void set frequencyScore(double frequency) {
    this._frequencyScore = frequency;
  }

  void set levenshteinScore(double levenshtein) {
    this._levenshteinScore = levenshtein;
  }

  void set score(double score) {
    this._score = score;
  }

  @override
  String toString() {
    return this.str +
        ",frequency:" +
        this.frequency.toString() +
        ",frequencyScore:" +
        this.frequencyScore.toString() +
        ",levenshteinD:" +
        this.levenshteinD.toString() +
        ",levenshteinScore:" +
        this.levenshteinScore.toString() +
        ",jaroWinklerScore:" +
        this.jaroWinklerScore.toString() +
        ",score:" +
        this.score.toString();
  }

  static int contains(List<SuggestWord> suggestWordList, String str) {
    for (int i = 0; i < suggestWordList.length; i++) {
      if (suggestWordList[i].getString() == str) {
        return i;
      }
    }
    return -1;
  }

  static List<String> convert(List<SuggestWord> suggestWordList) {
    return suggestWordList.map((sw) => sw.getString()).toList();
  }

  @override
  String getString() {
    return this.str;
  }
}
