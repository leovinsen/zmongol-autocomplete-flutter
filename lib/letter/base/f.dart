import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/splice/front_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class F extends Letter {
  late LetterShape fHeadChihiBaga;
  late LetterShape fHeadChihiIh;
  late LetterShape fMiddleChihiBaga;
  late LetterShape fMiddleChihiIh;
  late LetterShape fTailChihiEgsilge;

  F() : super("f") {
    fHeadChihiBaga = createFHeadChihiBaga().newUnmodifiable();
    fHeadChihiIh = createFHeadChihiIh().newUnmodifiable();
    fMiddleChihiBaga = createFMiddleChihiBaga().newUnmodifiable();
    fMiddleChihiIh = createFMiddleChihiIh().newUnmodifiable();
    fTailChihiEgsilge = createFTailChihiEgsilge().newUnmodifiable();
  }

  LetterShape createFHeadChihiBaga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.f_chihi_baga, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createFHeadChihiIh() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.f_chihi_ih, LetterLocation.HEAD);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_LIKE_HEAD_BANBVR_IH_B);
    return ls;
  }

  LetterShape createFMiddleChihiBaga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.f_chihi_baga, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createFMiddleChihiIh() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.f_chihi_ih, LetterLocation.MIDDLE);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_LIKE_HEAD_BANBVR_IH_B);
    return ls;
  }

  LetterShape createFTailChihiEgsilge() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.f_chihi_egsilge, LetterLocation.TAIL);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      fHeadChihiBaga,
      fHeadChihiIh,
      fMiddleChihiBaga,
      fMiddleChihiIh,
      fTailChihiEgsilge,
    ];
  }
}
