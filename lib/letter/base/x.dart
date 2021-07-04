import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class X extends Letter {
  late LetterShape xHead;
  late LetterShape xMidddle;
  late LetterShape xTail;

  X() : super("x") {
    xHead = createXHead().newUnmodifiable();
    xMidddle = createXMiddle().newUnmodifiable();
    xTail = createXTail().newUnmodifiable();
  }

  LetterShape createXHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.x_sechig, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createXMiddle() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.x_sechig, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createXTail() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.x_agshilga, LetterLocation.TAIL);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      xHead,
      xMidddle,
      xTail,
    ];
  }
}
