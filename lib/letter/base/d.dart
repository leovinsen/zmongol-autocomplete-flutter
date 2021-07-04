import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class D extends Letter {
  late LetterShape dHeadTSenj;
  late LetterShape dHeadDSenj;
  late LetterShape dMiddleDSenj;
  late LetterShape dMiddleGedesAchvg;
  late LetterShape dTailGedesOrhich;
  late LetterShape dTailDSenjSuul1;

  D() : super("d") {
    dHeadTSenj = createDHeadTSenj().newUnmodifiable();
    dHeadDSenj = createDHeadDSenj().newUnmodifiable();
    dMiddleDSenj = createDMiddleDSenj().newUnmodifiable();
    dMiddleGedesAchvg = createDMiddleGedesAchvg().newUnmodifiable();
    dTailGedesOrhich = createDTailGedesOrhich().newUnmodifiable();
    dTailDSenjSuul1 = createDTailDSenjSuul1().newUnmodifiable();
  }

  LetterShape createDHeadTSenj() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.t_senj, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createDHeadDSenj() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.d_senj, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createDMiddleDSenj() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.d_senj, LetterLocation.MIDDLE);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_EHSHIG);
    return ls;
  }

  LetterShape createDMiddleGedesAchvg() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.gedes + ZCode.achvg, LetterLocation.MIDDLE);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_NOT_EHSHIG);
    return ls;
  }

  LetterShape createDTailGedesOrhich() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.gedes + ZCode.orhich, LetterLocation.TAIL);
    return ls;
  }

  LetterShape createDTailDSenjSuul1() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.d_senj + ZCode.suul1, LetterLocation.TAIL);
    return ls;
  }
}
