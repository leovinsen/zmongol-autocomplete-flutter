import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_behind_rule.dart';

class BehindIsEhshig implements SplicingAtBehindRule {
  final matchLetters = new Set<String>();

  void _init() {
    if (!matchLetters.isEmpty) {
      return;
    }
    matchLetters.add(Letters.a.getLatinKey());
    matchLetters.add(Letters.e.getLatinKey());
    matchLetters.add(Letters.i.getLatinKey());
    matchLetters.add(Letters.o.getLatinKey());
    matchLetters.add(Letters.u.getLatinKey());
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
