import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontEmpty implements SplicingAtFrontRule {
  @override
  bool match(LetterShapeSequence lss) {
    return lss.isEmpty();
  }
}
