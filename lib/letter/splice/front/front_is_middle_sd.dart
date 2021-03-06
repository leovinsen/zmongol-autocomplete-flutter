import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontIsMiddleSD implements SplicingAtFrontRule {
  @override
  bool match(LetterShapeSequence lss) {
    if (lss.isEmpty()) {
      return false;
    }
    LetterShape last = lss.getLast();
    if (last == null) {
      return false;
    }
    return last.equals(Letters.s.sMiddle) ||
        last.equals(Letters.d.dMiddleGedesAchvg);
  }
}
