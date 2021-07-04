import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class Q extends Letter {
  late LetterShape qHead;
  late LetterShape qMiddle;
  late LetterShape qTail;

  Q() : super("q") {
    qHead = createQHead().newUnmodifiable();
    qMiddle = createQMiddle().newUnmodifiable();
    qTail = createQTail().newUnmodifiable();
  }

  LetterShape createQHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.q_acha, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createQMiddle() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.q_acha, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createQTail() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.q_acha + ZCode.suul1, LetterLocation.TAIL);
    return ls;
  }
}
