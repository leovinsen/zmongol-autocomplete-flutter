import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class C extends Letter {
  late LetterShape cHead;
  late LetterShape cMiddle;
  late LetterShape cTail;

  C() : super("c") {
    cHead = createCHead().newUnmodifiable();
    cMiddle = createCMiddle().newUnmodifiable();
    cTail = createCTail().newUnmodifiable();
  }

  LetterShape createCHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.c_acha, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createCMiddle() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.c_acha, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createCTail() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.c_acha + ZCode.suul1, LetterLocation.TAIL);
    return ls;
  }
}
