import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class GaligH extends Letter {
  late LetterShape galigHHead;
  late LetterShape galigHMiddle;

  GaligH() : super("galig_h") {
    galigHHead = createGaligHHead().newUnmodifiable();
    galigHMiddle = createGaligHMiddle().newUnmodifiable();
  }

  LetterShape createGaligHHead() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.titem + ZCode.galig_tvvrai, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createGaligHMiddle() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.galig_tvvrai, LetterLocation.MIDDLE);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [galigHHead, galigHMiddle];
  }
}
