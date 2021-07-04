import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class N extends Letter {
  late LetterShape nHead;
  late LetterShape nMiddleNAchvg;
  late LetterShape nMiddleNOrhich;
  late LetterShape nMiddleAchvg;
  late LetterShape nTailOrhich;

  N() : super("n") {
    nHead = createNHead().newUnmodifiable();
    nMiddleNAchvg = createNMiddleNAchvg().newUnmodifiable();
    nMiddleNOrhich = createNMiddleNOrhich().newUnmodifiable();
    nMiddleAchvg = createNMiddleAchvg().newUnmodifiable();
    nTailOrhich = createNTailOrhich().newUnmodifiable();
  }

  LetterShape createNHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.n_titem, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createNMiddleNAchvg() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.n_achvg, LetterLocation.MIDDLE);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_EHSHIG);
    return ls;
  }

  LetterShape createNMiddleNOrhich() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.n_orhich, LetterLocation.MIDDLE);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    return ls;
  }

  LetterShape createNMiddleAchvg() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.achvg, LetterLocation.MIDDLE);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_NOT_EHSHIG);
    return ls;
  }

  LetterShape createNTailOrhich() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.orhich, LetterLocation.TAIL);
    return ls;
  }
}
