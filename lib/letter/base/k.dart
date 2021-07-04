import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class K extends Letter {
  late LetterShape kHeadBaga;
  late LetterShape kHeadIh;
  late LetterShape kMiddleBaga;
  late LetterShape kMiddleIh;
  late LetterShape kTailEgsilge;

  K() : super("k") {
    kHeadBaga = createKHeadBaga().newUnmodifiable();
    kHeadIh = createKHeadIh().newUnmodifiable();
    kMiddleBaga = createKMiddleBaga().newUnmodifiable();
    kMiddleIh = createKMiddleIh().newUnmodifiable();
    kTailEgsilge = createKTailEgsilge().newUnmodifiable();
  }

  LetterShape createKHeadBaga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.k_baga, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createKHeadIh() {
    LetterShape ls = new LetterShape(latinKey, ZCode.k_ih, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createKMiddleBaga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.k_baga, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createKMiddleIh() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.k_ih, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createKTailEgsilge() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.k_egsilge, LetterLocation.TAIL);
    return ls;
  }
}
