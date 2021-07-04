import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class P extends Letter {
  late LetterShape pHeadChihiBaga;
  late LetterShape pHeadChihiIh;
  late LetterShape pMiddleChihiBaga;
  late LetterShape pMiddleChihiIh;
  late LetterShape pTailChihiEgsilge;

  P() : super("p") {
    pHeadChihiBaga = createPHeadChihiBaga().newUnmodifiable();
    pHeadChihiIh = createPHeadChihiIh().newUnmodifiable();
    pMiddleChihiBaga = createPMiddleChihiBaga().newUnmodifiable();
    pMiddleChihiIh = createPMiddleChihiIh().newUnmodifiable();
    pTailChihiEgsilge = createPTailChihiEgsilge().newUnmodifiable();
  }

  LetterShape createPHeadChihiBaga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.p_chihi_baga, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createPHeadChihiIh() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.p_chihi_ih, LetterLocation.HEAD);

    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_LIKE_HEAD_BANBVR_IH_B);

    return ls;
  }

  LetterShape createPMiddleChihiBaga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.p_chihi_baga, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createPMiddleChihiIh() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.p_chihi_ih, LetterLocation.MIDDLE);

    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_LIKE_HEAD_BANBVR_IH_B);

    return ls;
  }

  LetterShape createPTailChihiEgsilge() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.p_chihi_egsilge, LetterLocation.TAIL);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      pHeadChihiBaga,
      pHeadChihiIh,
      pMiddleChihiBaga,
      pMiddleChihiIh,
      pTailChihiEgsilge,
    ];
  }
}
