import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeTailGedesO implements SplicingAtFrontRule {
  final Set<LetterShape> matchShapes;

  FrontLikeTailGedesO() : this.matchShapes = Set<LetterShape>();

  void _init() {
    if (!this.matchShapes.isEmpty) {
      return;
    }
    this.matchShapes.add(Letters.B.bHeadBanbvrIh);
    this.matchShapes.add(Letters.B.bMiddleBanbvrIh);
    this.matchShapes.add(Letters.P.pHeadChihiIh);
    this.matchShapes.add(Letters.P.pMiddleChihiIh);
    this.matchShapes.add(Letters.F.fHeadChihiIh);
    this.matchShapes.add(Letters.F.fMiddleChihiIh);
    this.matchShapes.add(Letters.K.kHeadIh);
    this.matchShapes.add(Letters.K.kMiddleIh);
  }

  @override
  bool match(LetterShapeSequence lss) {
    this._init();
    if (lss.isEmpty()) {
      return false;
    }
    LetterShape last = lss.getLast();
    if (last == null) {
      return false;
    }
    return this.matchShapes.contains(last);
  }
}