import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_behind_rule.dart';

class BehindEmpty implements SplicingAtBehindRule {
  @override
  bool match(LetterShape? ls) {
    return ls == null;
  }
}
