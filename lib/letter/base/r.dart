import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class R extends Letter {
  late LetterShape rHead;
  late LetterShape rMiddleErbgeljinSilbi;
  late LetterShape rMiddleSuul;
  late LetterShape rTail;

  R() : super("r") {
    rHead = createRHead().newUnmodifiable();
    rMiddleErbgeljinSilbi = createRMiddleErbgeljinSilbi().newUnmodifiable();
    rMiddleSuul = createRMiddleSuul().newUnmodifiable();
    rTail = createRTail().newUnmodifiable();
  }

  LetterShape createRHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.r_erbgeljin_silbi, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createRMiddleErbgeljinSilbi() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.r_erbgeljin_silbi, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createRMiddleSuul() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.r_suul, LetterLocation.MIDDLE);
    ls.setFuzzyBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_AE_CHACHILGA);
    return ls;
  }

  LetterShape createRTail() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.r_suul, LetterLocation.TAIL);
    return ls;
  }
}
