import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_behind_rule.dart';

class BehindLikeMiddleBanbvrBagaO implements SplicingAtBehindRule {
  @override
  bool match(LetterShape? ls) {
    if (ls == null) {
      return false;
    }
    return ls.equals(Letters.A.aTailChachilga);
  }
}
