import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/splice/front_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class H extends Letter {
  late LetterShape hHeadHanhar;
  late LetterShape hHeadHinhir;
  late LetterShape hHeadHunhur;
  late LetterShape hMiddleHinhir;
  late LetterShape hMiddleHunhur;
  late LetterShape hMiddleDoubleAchvg;
  late LetterShape hMiddleAgsilga;
  late LetterShape hTailAgsilga;
  late LetterShape hTailSilbiVrvgsilga;

  H() : super("h") {
    hHeadHanhar = createHHeadHanhar().newUnmodifiable();
    hHeadHinhir = createHHeadHinhir().newUnmodifiable();
    hHeadHunhur = createHHeadHunhur().newUnmodifiable();
    hMiddleHinhir = createHMiddleHinhir().newUnmodifiable();
    hMiddleHunhur = createHMiddleHunhur().newUnmodifiable();
    hMiddleDoubleAchvg = createHMiddleDoubleAchvg().newUnmodifiable();
    hMiddleAgsilga = createHMiddleAgsilga().newUnmodifiable();
    hTailAgsilga = createHTailAgsilga().newUnmodifiable();
    hTailSilbiVrvgsilga = createHTailSilbiVrvgsilga().newUnmodifiable();
  }

  LetterShape createHHeadHanhar() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.h_hanhar, LetterLocation.HEAD);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_CHINGA_EHSHIG);
    return ls;
  }

  LetterShape createHHeadHinhir() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.hinhir, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createHHeadHunhur() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.hunhur, LetterLocation.HEAD);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_LIKE_HEAD_BANBVR_IH_B);
    return ls;
  }

  LetterShape createHMiddleHinhir() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.hinhir, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createHMiddleHunhur() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.hunhur, LetterLocation.MIDDLE);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_LIKE_HEAD_BANBVR_IH_B);
    return ls;
  }

  LetterShape createHMiddleDoubleAchvg() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.achvg + ZCode.achvg, LetterLocation.MIDDLE);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_CHINGA_EHSHIG);
    return ls;
  }

  LetterShape createHMiddleAgsilga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.agsilga, LetterLocation.MIDDLE);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_A_CHACHILGA);
    return ls;
  }

  LetterShape createHTailAgsilga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.agsilga, LetterLocation.TAIL);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_IS_CHIGA_SEQUENCE);
    return ls;
  }

  LetterShape createHTailSilbiVrvgsilga() {
    LetterShape ls = new LetterShape(latinKey,
        ZCode.silbi + ZCode.vrvgsilga_or_chachilga, LetterLocation.TAIL);
    ls.setSevereFrontAtRule(FrontRuleHolder.FRONT_IS_NOT_CHIGA_SEQUENCE);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      hHeadHanhar,
      hHeadHinhir,
      hHeadHunhur,
      hMiddleHinhir,
      hMiddleHunhur,
      hMiddleDoubleAchvg,
      hMiddleAgsilga,
      hTailAgsilga,
      hTailSilbiVrvgsilga,
    ];
  }
}
