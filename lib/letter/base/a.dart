import '../letter.dart';
import '../letter_location.dart';
import '../letter_shape.dart';
import '../zcode.dart';

class A extends Letter {
  final LetterShape aHead;
  final LetterShape aMiddle;
  final LetterShape aTailOrhich;
  final LetterShape aTailChachilga;
  final LetterShape aTailVrvgsilga;

  A()
      : aHead = createAHead().newUnmodifiable(),
        aMiddle = createAMiddle().newUnmodifiable(),
        aTailOrhich = createATailOrhich().newUnmodifiable(),
        aTailChachilga = createATailChachilga().newUnmodifiable(),
        aTailVrvgsilga = createATailVrvgsilga().newUnmodifiable(),
        super("a");

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
    LetterShape ls = new LetterShape(
        latinKey, Strings.valueOf(ZCode.achvg), LetterLocation.MIDDLE);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_MIDDLE_A);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createATailOrhich() {
    LetterShape ls = new LetterShape(
        latinKey, Strings.valueOf(ZCode.orhich), LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_ORHICH_A);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  LetterShape createATailChachilga() {
    LetterShape ls = new LetterShape(latinKey,
        Strings.valueOf(ZCode.vrvgsilga_or_chachilga), LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_CHACHILGA_A);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  LetterShape createATailVrvgsilga() {
    LetterShape ls = new LetterShape(
        latinKey,
        Strings.valueOf(ZCode.achvg, ZCode.vrvgsilga_or_chachilga),
        LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_VRVGSILGA_A);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }
}
