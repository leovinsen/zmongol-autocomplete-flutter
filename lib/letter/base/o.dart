import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/splice/front_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class O extends Letter {
  late LetterShape oHeadTitemGedes;
  late LetterShape oHeadGedes;
  late LetterShape oMiddleGedes;
  late LetterShape oMiddleBanbvrBaga;
  late LetterShape oTailGedes;
  late LetterShape oTailBanbvrBaga;

  O() : super("o") {
    oHeadTitemGedes = createOHeadTitemGedes().newUnmodifiable();
    oHeadGedes = createOHeadGedes().newUnmodifiable();
    oMiddleGedes = createOMiddleGedes().newUnmodifiable();
    oMiddleBanbvrBaga = createOMiddleBanbvrBaga().newUnmodifiable();
    oTailGedes = createOTailGedes().newUnmodifiable();
    oTailBanbvrBaga = createOTailBanbvrBaga().newUnmodifiable();
  }

  LetterShape createOHeadTitemGedes() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.titem + ZCode.gedes, LetterLocation.HEAD);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createOHeadGedes() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.gedes, LetterLocation.HEAD);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_EMPTY);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createOMiddleGedes() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.gedes, LetterLocation.MIDDLE);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(null);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_MIDDLE_O);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_NOT_EMPTY);
    return ls;
  }

  LetterShape createOMiddleBanbvrBaga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.b_banbvr_baga, LetterLocation.MIDDLE);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_LIKE_MIDDLE_BANBVR_BAGA_O);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_BANBVR_BAGA);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_LIKE_MIDDLE_BANBVR_BAGA_O);
    return ls;
  }

  LetterShape createOTailGedes() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.gedes, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_GEDES_O);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  LetterShape createOTailBanbvrBaga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.b_banbvr_baga, LetterLocation.TAIL);
    ls.setFuzzyFrontAtRule(FrontRuleHolder.FRONT_NOT_EMPTY);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_LIKE_TAIL_BANBVR_BAGA);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_EMPTY);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      oHeadTitemGedes,
      oHeadGedes,
      oMiddleGedes,
      oMiddleBanbvrBaga,
      oTailGedes,
      oTailBanbvrBaga,
    ];
  }
}
