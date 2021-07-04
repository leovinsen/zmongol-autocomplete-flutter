import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class GaligCH extends Letter {
  late LetterShape galigChHead;

  GaligCH() : super("galig_ch") {
    galigChHead = createGaligChHead().newUnmodifiable();
  }

  LetterShape createGaligChHead() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.gedes + ZCode.gedes, LetterLocation.HEAD);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [galigChHead];
  }
}
