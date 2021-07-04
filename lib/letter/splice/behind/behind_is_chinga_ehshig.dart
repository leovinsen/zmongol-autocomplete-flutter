import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_behind_rule.dart';

class BehindIsChingaEhshig implements SplicingAtBehindRule {
  @override
  bool match(LetterShape? ls) {
    if (ls == null) {
      return false;
    }
    return ls.getLatinKey() == (Letters.A.getLatinKey()) ||
        ls.getLatinKey() == (Letters.O.getLatinKey());
  }
}
