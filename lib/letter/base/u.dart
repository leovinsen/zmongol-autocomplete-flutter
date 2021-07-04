import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/splice/front_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class U extends Letter {
  late LetterShape uHead;
  late LetterShape uMiddleGedesSilbi;
  late LetterShape uMiddleGedes;
  late LetterShape uTailGedes;
  late LetterShape uTailBanbvrBaga;
  late LetterShape uTailGedesSuul1;

  U() : super("u") {
    uHead = createUHead().newUnmodifiable();
    uMiddleGedesSilbi = createUMiddleGedesSilbi().newUnmodifiable();
    uMiddleGedes = createUMiddleGedes().newUnmodifiable();
    uTailGedes = createUTailGedes().newUnmodifiable();
    uTailBanbvrBaga = createUTailBanbvrBaga().newUnmodifiable();
    uTailGedesSuul1 = createUTailGedesSuul1().newUnmodifiable();
  }

  LetterShape createUHead() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.titem + ZCode.gedes + ZCode.silbi, LetterLocation.HEAD);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createUMiddleGedesSilbi() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.gedes + ZCode.silbi, LetterLocation.MIDDLE);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_MIDDLE_GEDES_SILBI_U);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createUMiddleGedes() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.gedes, LetterLocation.MIDDLE);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_MIDDLE_GEDES_U);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createUTailGedes() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.gedes, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_GEDES_U);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  LetterShape createUTailBanbvrBaga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.b_banbvr_baga, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_BANBVR_BAGA_U);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  LetterShape createUTailGedesSuul1() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.gedes + ZCode.suul1, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_TAIL_GEDES_SUUL1_U);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }
}
