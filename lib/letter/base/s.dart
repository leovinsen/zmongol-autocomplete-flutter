import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class S extends Letter {
  late LetterShape sHead;
  late LetterShape sMiddle;
  late LetterShape sTail;

  S() : super("s") {
    sHead = createSHead().newUnmodifiable();
    sMiddle = createSMiddle().newUnmodifiable();
    sTail = createSTail().newUnmodifiable();
  }

  LetterShape createSHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.s_sechig, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createSMiddle() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.s_sechig, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createSTail() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.s_agshilga, LetterLocation.TAIL);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      sHead,
      sMiddle,
      sTail,
    ];
  }
}
