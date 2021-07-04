import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/splice/front_rule_holder.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeTailHvmsI implements SplicingAtFrontRule {
  @override
  bool match(LetterShapeSequence lss) {
    if (lss.isEmpty()) {
      return false;
    }
    return !FrontRuleHolder.FRONT_LIKE_TAIL_SILBI_SUUL_1_I.match(lss);
  }
}
