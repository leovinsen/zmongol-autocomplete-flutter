import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/nature.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontIsChigaSequence implements SplicingAtFrontRule {
  @override
  bool match(LetterShapeSequence lss) {
    if (lss.isEmpty()) {
      return false;
    }
    return lss.nature == Nature.CHAGH;
  }
}
