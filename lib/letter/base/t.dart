import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class T extends Letter {
  late LetterShape tHead;
  late LetterShape tMiddleTSenj;
  late LetterShape tMiddleDSenj;
  late LetterShape tTail;

  T() : super("t") {
    tHead = createTHead().newUnmodifiable();
    tMiddleTSenj = createTMiddleTSenj().newUnmodifiable();
    tMiddleDSenj = createTMiddleDSenj().newUnmodifiable();
    tTail = createTTail().newUnmodifiable();
  }

  LetterShape createTHead() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.t_senj, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createTMiddleTSenj() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.t_senj, LetterLocation.MIDDLE);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_IS_NOT_EHSHIG);
    return ls;
  }

  LetterShape createTMiddleDSenj() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.d_senj, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createTTail() {
    LetterShape ls = new LetterShape(
        latinKey, ZCode.t_senj + ZCode.suul1, LetterLocation.TAIL);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      tHead,
      tMiddleTSenj,
      tMiddleDSenj,
      tTail,
    ];
  }
}
