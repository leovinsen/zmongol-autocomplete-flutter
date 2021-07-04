import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/splice/behind_rule_holder.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class B extends Letter {
  late LetterShape bHeadBanbvrBaga;
  late LetterShape bHeadBanbvrIh;
  late LetterShape bMiddleBanbvrBaga;
  late LetterShape bMiddleBanbvrIh;
  late LetterShape bTailBanbvrEgsilge;

  B() : super("b") {
    bHeadBanbvrBaga = createBHeadBanbvrBaga().newUnmodifiable();
    bHeadBanbvrIh = createBHeadBanbvrIh().newUnmodifiable();
    bMiddleBanbvrBaga = createBMiddleBanbvrBaga().newUnmodifiable();
    bMiddleBanbvrIh = createBMiddleBanbvrIh().newUnmodifiable();
    bTailBanbvrEgsilge = createBTailBanbvrEgsilge().newUnmodifiable();
  }

  LetterShape createBHeadBanbvrBaga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.b_banbvr_baga, LetterLocation.HEAD);
    return ls;
  }

  LetterShape createBHeadBanbvrIh() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.b_banbvr_ih, LetterLocation.HEAD);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_LIKE_HEAD_BANBVR_IH_B);
    return ls;
  }

  LetterShape createBMiddleBanbvrBaga() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.b_banbvr_baga, LetterLocation.MIDDLE);
    return ls;
  }

  LetterShape createBMiddleBanbvrIh() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.b_banbvr_ih, LetterLocation.MIDDLE);
    ls.setSevereBehindAtRule(BehindRuleHolder.BEHIND_LIKE_HEAD_BANBVR_IH_B);
    return ls;
  }

  LetterShape createBTailBanbvrEgsilge() {
    LetterShape ls =
        new LetterShape(latinKey, ZCode.b_banbvr_egsilge, LetterLocation.TAIL);
    return ls;
  }

  @override
  List<LetterShape> getLetterShapes() {
    return [
      bHeadBanbvrBaga,
      bHeadBanbvrIh,
      bMiddleBanbvrBaga,
      bMiddleBanbvrIh,
      bTailBanbvrEgsilge,
    ];
  }
}
