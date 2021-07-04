import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class Y extends Letter {
  late LetterShape yHead;
  late LetterShape yMiddleErtegerSilbi;
  late LetterShape yMiddleHvms;
  late LetterShape yTail;

  Y() : super("y") {
    yHead = createYHead().newUnmodifiable();
    yMiddleErtegerSilbi = createYMiddleErtegerSilbi().newUnmodifiable();
    yMiddleHvms = createYMiddleHvms().newUnmodifiable();
    yTail = createYTail().newUnmodifiable();
  }

  LetterShape createYHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.y_erteger_silbi, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createYMiddleErtegerSilbi() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.y_erteger_silbi, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createYMiddleHvms() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.hvms, LetterLocation.MIDDLE);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    return ls;
  }

  LetterShape createYTail() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.y_erteger_silbi + ZCode.suul1, LetterLocation.TAIL);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      yHead,
      yMiddleErtegerSilbi,
      yMiddleHvms,
      yTail,
    ];
  }
}
