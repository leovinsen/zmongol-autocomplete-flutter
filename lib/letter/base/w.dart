import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class W extends Letter {
  late LetterShape wHead;
  late LetterShape wMiddle;
  late LetterShape wTail;

  W() : super("w") {
    wHead = createWHead().newUnmodifiable();
    wMiddle = createWMiddle().newUnmodifiable();
    wTail = createWTail().newUnmodifiable();
  }

  LetterShape createWHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.w_gohtai_silbi, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createWMiddle() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.w_gohtai_silbi, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createWTail() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.w_gohtai_silbi + ZCode.suul1, LetterLocation.TAIL);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      wHead,
      wMiddle,
      wTail,
    ];
  }
}
