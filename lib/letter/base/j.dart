import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class J extends Letter {
  late LetterShape jHead;
  late LetterShape jMiddle;
  late LetterShape jTail;

  J() : super("j") {
    jHead = createJHead().newUnmodifiable();
    jMiddle = createJMiddle().newUnmodifiable();
    jTail = createJTail().newUnmodifiable();
  }

  LetterShape createJHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.silbi, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createJMiddle() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.j_bosoo_silbi, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createJTail() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.j_bosoo_silbi + ZCode.suul1, LetterLocation.TAIL);
    return ls;
  }
}
