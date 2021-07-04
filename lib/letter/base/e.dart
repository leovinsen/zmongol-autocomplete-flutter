import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/splice/front_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class E extends Letter {
  late LetterShape eHead;
  late LetterShape eMiddle;
  late LetterShape eTailOrhich;
  late LetterShape eTailChachilga;
  late LetterShape eTailVrvgsilga;

  E() : super("e") {
    eHead = createEHeadShape().newUnmodifiable();
    eMiddle = createEMiddleShape().newUnmodifiable();
    eTailOrhich = createETailOrhich().newUnmodifiable();
    eTailChachilga = createETailChachilga().newUnmodifiable();
    eTailVrvgsilga = createETailVrvgsilga().newUnmodifiable();
  }

  LetterShape createEHeadShape() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.titem, LetterLocation.HEAD);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createEMiddleShape() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.achvg, LetterLocation.MIDDLE);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_MIDDLE_E);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createETailOrhich() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.orhich, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_ORHICH_E);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  LetterShape createETailChachilga() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.vrvgsilga_or_chachilga, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_CHACHILGA_E);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  LetterShape createETailVrvgsilga() {
    LetterShape ls = new LetterShape(latinKey,
        ZCode.achvg + ZCode.vrvgsilga_or_chachilga, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_VRVGSILGA_E);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      eHead,
      eMiddle,
      eTailOrhich,
      eTailChachilga,
      eTailVrvgsilga,
    ];
  }
}
