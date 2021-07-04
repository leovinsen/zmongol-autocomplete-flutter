import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class GaligR extends Letter {
  late LetterShape galigRHead;

  GaligR() : super("galig_r") {
    galigRHead = createGaligRHead().newUnmodifiable();
  }

  LetterShape createGaligRHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.galig_r_malgai, LetterLocation.HEAD);
    return ls;
  }
}
