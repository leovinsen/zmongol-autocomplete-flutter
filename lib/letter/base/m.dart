import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class M extends Letter {
  late LetterShape mHead;
  late LetterShape mMiddleAchvg;
  late LetterShape mMiddleHurbelge;
  late LetterShape mTailHurbelge;

  M() : super("m") {
    mHead = createMHead().newUnmodifiable();
    mMiddleAchvg = createMMiddleAchvg().newUnmodifiable();
    mMiddleHurbelge = createMMiddleHurbelge().newUnmodifiable();
    mTailHurbelge = createMTailHurbelge().newUnmodifiable();
  }

  LetterShape createMHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.m_titem, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createMMiddleAchvg() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.m_achvg, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createMMiddleHurbelge() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.m_hurbelge, LetterLocation.MIDDLE);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    return ls;
  }

  LetterShape createMTailHurbelge() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.m_hurbelge, LetterLocation.TAIL);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      mHead,
      mMiddleAchvg,
      mMiddleHurbelge,
      mTailHurbelge,
    ];
  }
}
