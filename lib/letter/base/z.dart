import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class Z extends Letter {
  late LetterShape zHead;
  late LetterShape zMiddle;
  late LetterShape zTail;

  Z() : super("z") {
    zHead = createZHead().newUnmodifiable();
    zMiddle = createZMiddle().newUnmodifiable();
    zTail = createZTail().newUnmodifiable();
  }

  LetterShape createZHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.z_acha, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createZMiddle() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.z_acha, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createZTail() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.z_acha + ZCode.suul1, LetterLocation.TAIL);
    return ls;
  }
}
