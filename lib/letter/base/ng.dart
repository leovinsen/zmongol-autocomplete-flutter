import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

///@deprecated
class NG extends Letter {
  late LetterShape ngMiddle;
  late LetterShape ngTail;

  NG() : super("ng") {
    ngMiddle = createNgMiddle().newUnmodifiable();
    ngTail = createNgTail().newUnmodifiable();
  }

  LetterShape createNgMiddle() {
    LetterShape ls = new LetterShape(
        latinKey,
        ZCode.achvg + ZCode.silbi + ZCode.vrvgsilga_or_chachilga,
        LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createNgTail() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.achvg + ZCode.hinhir, LetterLocation.TAIL);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [ngMiddle, ngTail];
  }
}
