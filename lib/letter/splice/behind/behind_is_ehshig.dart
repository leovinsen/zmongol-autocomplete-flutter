import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_behind_rule.dart';

class BehindIsEhshig implements SplicingAtBehindRule {
  final matchLetters = new Set<String>();

  void _init() {
    if (!matchLetters.isEmpty) {
      return;
    }
    matchLetters.add(Letters.A.getLatinKey());
    matchLetters.add(Letters.E.getLatinKey());
    matchLetters.add(Letters.I.getLatinKey());
    matchLetters.add(Letters.O.getLatinKey());
    matchLetters.add(Letters.U.getLatinKey());
  }

  @override
  bool match(LetterShape? ls) {
    _init();
    if (ls == null) {
      return false;
    }
    return matchLetters.contains(ls.getLatinKey());
  }
}
