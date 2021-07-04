import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_behind_rule.dart';

class BehindIsNotEhshig implements SplicingAtBehindRule {
  @override
  bool match(LetterShape? ls) {
    if (ls == null) {
      return false;
    }
    return !BehindRuleHolder.BEHIND_IS_EHSHIG.match(ls);
  }
}
