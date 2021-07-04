import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/splice/front_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class I extends Letter {
  late LetterShape iHead;
  late LetterShape iiHead;
  late LetterShape iMiddle;
  late LetterShape iiMiddle;
  late LetterShape iTail;
  late LetterShape iTailSilbiSuul1;

  I() : super("i") {
    iHead = createIhead().newUnmodifiable();
    iMiddle = createIMiddle().newUnmodifiable();
    iTail = createITail().newUnmodifiable();
    iTailSilbiSuul1 = createITailSilbiSuul1().newUnmodifiable();
    iiHead = createIIHead().newUnmodifiable();
    iiMiddle = createIIMiddle().newUnmodifiable();
  }

  LetterShape createIhead() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.titem + ZCode.silbi, LetterLocation.HEAD);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createIIHead() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.silbi + ZCode.silbi, LetterLocation.HEAD);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createIMiddle() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.silbi, LetterLocation.MIDDLE);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_MIDDLE_I);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createIIMiddle() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.silbi + ZCode.silbi, LetterLocation.MIDDLE);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_MIDDLE_II);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createITail() {
    LetterShape ls = new LetterShape(latinKey, ZCode.hvms, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_HVMS_I);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  LetterShape createITailSilbiSuul1() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.silbi + ZCode.suul1, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_SILBI_SUUL_1_I);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      iHead,
      iiHead,
      iMiddle,
      iiMiddle,
      iTail,
      iTailSilbiSuul1,
    ];
  }
}
