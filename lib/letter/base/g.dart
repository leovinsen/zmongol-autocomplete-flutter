import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/splice/front_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class G extends Letter {
  late LetterShape gHeadHanhar;
  late LetterShape gHeadHinhir;
  late LetterShape gHeadHunhur;
  late LetterShape gMiddleHinhir;
  late LetterShape gMiddleHunhur;
  late LetterShape gMiddleDoubleNAchvg;
  late LetterShape gMiddleDoubleAchvg;
  late LetterShape gMiddleDoubleAchvgDagbvr;
  late LetterShape gMiddleDvsaltaiAgsilga;
  late LetterShape gMiddleAgsilga;
  late LetterShape gTailAgsilga;
  late LetterShape gTailSilbiVrvgsilga;

  G() : super("g") {
    gHeadHanhar = createGHeadHanhar().newUnmodifiable();
    gHeadHinhir = createGHeadHinhir().newUnmodifiable();
    gHeadHunhur = createGHeadHunhur().newUnmodifiable();
    gMiddleHinhir = createGMiddleHinhir().newUnmodifiable();
    gMiddleHunhur = createGMiddleHunhur().newUnmodifiable();
    gMiddleDoubleNAchvg = createGMiddleDoubleNAchvg().newUnmodifiable();
    gMiddleDoubleAchvg = createGMiddleDoubleAchvg().newUnmodifiable();
    gMiddleDoubleAchvgDagbvr =
        createGMiddleDoubleAchvgDagbvr().newUnmodifiable();
    gMiddleDvsaltaiAgsilga = createGMiddleDvsaltaiAgsilga().newUnmodifiable();
    gMiddleAgsilga = createGMiddleAgsilga().newUnmodifiable();
    gTailAgsilga = createGTailAgsilga().newUnmodifiable();
    gTailSilbiVrvgsilga = createGTailSilbiVrvgsilga().newUnmodifiable();
  }

  LetterShape createGHeadHanhar() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.g_hanhar, LetterLocation.HEAD);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_CHINGA_EHSHIG);
    return ls;
  }

  LetterShape createGHeadHinhir() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.hinhir, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createGHeadHunhur() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.hunhur, LetterLocation.HEAD);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_LIKE_HEAD_BANBVR_IH_B);
    return ls;
  }

  LetterShape createGMiddleHinhir() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.hinhir, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createGMiddleHunhur() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.hunhur, LetterLocation.MIDDLE);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_LIKE_HEAD_BANBVR_IH_B);
    return ls;
  }

  LetterShape createGMiddleDoubleNAchvg() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.n_achvg + ZCode.n_achvg, LetterLocation.MIDDLE);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_IS_NOT_MIDDLE_SD);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_CHINGA_EHSHIG);
    return ls;
  }

  LetterShape createGMiddleDoubleAchvg() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.achvg + ZCode.achvg, LetterLocation.MIDDLE);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_IS_MIDDLE_SD);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_CHINGA_EHSHIG);
    return ls;
  }

  LetterShape createGMiddleDoubleAchvgDagbvr() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.achvg + ZCode.achvg, LetterLocation.MIDDLE);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_NOT_EHSHIG);
    return ls;
  }

  LetterShape createGMiddleDvsaltaiAgsilga() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.dvsaltai_agsilga, LetterLocation.MIDDLE);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_IS_NOT_MIDDLE_SD);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_A_CHACHILGA);
    return ls;
  }

  LetterShape createGMiddleAgsilga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.agsilga, LetterLocation.MIDDLE);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_IS_MIDDLE_SD);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_A_CHACHILGA);
    return ls;
  }

  LetterShape createGTailAgsilga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.agsilga, LetterLocation.TAIL);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_IS_CHIGA_SEQUENCE);
    return ls;
  }

  LetterShape createGTailSilbiVrvgsilga() {
    LetterShape ls = new LetterShape(latinKey,
        ZCode.silbi + ZCode.vrvgsilga_or_chachilga, LetterLocation.TAIL);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_IS_NOT_CHIGA_SEQUENCE);
    return ls;
  }
}
