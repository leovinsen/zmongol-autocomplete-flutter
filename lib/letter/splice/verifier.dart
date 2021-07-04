import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';

class Verifier {
  static bool canFuzzySplicing(LetterShapeSequence lss, LetterShape ls) {
    if (ls.getFuzzyFrontAtRule() != null &&
        (!ls.getFuzzyFrontAtRule()!.match(lss))) {
      return false;
    }
    if (lss.isNotEmpty()) {
      LetterShape last = lss.getLast();
      return (last.getFuzzyBehindAtRule() == null) ||
          last.getFuzzyBehindAtRule()!.match(ls);
    }
    return true;
  }

  static bool canSevereSplicing(LetterShapeSequence lss, LetterShape ls) {
    if (ls.getSevereFrontAtRule() != null &&
        (!ls.getSevereFrontAtRule()!.match(lss))) {
      return false;
    }
    if (lss.isNotEmpty()) {
      LetterShape last = lss.getLast();
      return (last.getSevereBehindAtRule() == null) ||
          last.getSevereBehindAtRule()!.match(ls);
    }
    return true;
  }
}
