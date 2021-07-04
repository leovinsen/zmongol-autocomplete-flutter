import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class GaligL extends Letter {
  late LetterShape galigLHead;

  GaligL() : super("galig_l") {
    galigLHead = createGaligLHead().newUnmodifiable();
  }

  LetterShape createGaligLHead() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.l_titem + ZCode.galig_tvvrai, LetterLocation.HEAD);
    return ls;
  }
}
