import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class GaligZH extends Letter {
  late LetterShape galigZhHead;

  GaligZH() : super("galig_zh") {
    galigZhHead = createGaligZhHead().newUnmodifiable();
  }

  LetterShape createGaligZhHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.galig_tvvrai, LetterLocation.HEAD);
    return ls;
  }
}
