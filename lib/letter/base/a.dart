import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/splice/front_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class A extends Letter {
  late LetterShape aHead;
  late LetterShape aMiddle;
  late LetterShape aTailOrhich;
  late LetterShape aTailChachilga;
  late LetterShape aTailVrvgsilga;

  A() : super("a") {
    aHead = createAHead().newUnmodifiable();
    aMiddle = createAMiddle().newUnmodifiable();
    aTailOrhich = createATailOrhich().newUnmodifiable();
    aTailChachilga = createATailChachilga().newUnmodifiable();
    aTailVrvgsilga = createATailVrvgsilga().newUnmodifiable();
  }

  LetterShape createAHead() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.titem + ZCode.achvg, LetterLocation.HEAD);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createAMiddle() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.achvg, LetterLocation.MIDDLE);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_MIDDLE_A);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createATailOrhich() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.orhich, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_ORHICH_A);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  LetterShape createATailChachilga() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.vrvgsilga_or_chachilga, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_CHACHILGA_A);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  LetterShape createATailVrvgsilga() {
    LetterShape ls = new LetterShape(latinKey,
        ZCode.achvg + ZCode.vrvgsilga_or_chachilga, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_VRVGSILGA_A);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      aHead,
      aMiddle,
      aTailOrhich,
      aTailChachilga,
      aTailVrvgsilga,
    ];
  }
}
