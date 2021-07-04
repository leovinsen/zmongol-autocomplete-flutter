import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class L extends Letter {
  late LetterShape lHead;
  late LetterShape lMiddleAchvg;
  late LetterShape lMiddleHurbelge;
  late LetterShape lTailHurbelge;

  L() : super("l") {
    lHead = createLHead().newUnmodifiable();
    lMiddleAchvg = createLMiddleAchvg().newUnmodifiable();
    lMiddleHurbelge = createLMiddleHurbelge().newUnmodifiable();
    lTailHurbelge = createLTailHurbelge().newUnmodifiable();
  }

  LetterShape createLHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.l_titem, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createLMiddleAchvg() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.l_achvg, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createLMiddleHurbelge() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.l_hurbelge, LetterLocation.MIDDLE);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    return ls;
  }

  LetterShape createLTailHurbelge() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.l_hurbelge, LetterLocation.TAIL);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      lHead,
      lMiddleAchvg,
      lMiddleHurbelge,
      lTailHurbelge,
    ];
  }
}
