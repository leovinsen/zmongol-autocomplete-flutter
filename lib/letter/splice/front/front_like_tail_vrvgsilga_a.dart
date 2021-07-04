import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeTailVrvgsilgaA implements SplicingAtFrontRule {
  final Set<LetterShape> matchShapes;

  FrontLikeTailVrvgsilgaA() : this.matchShapes = Set<LetterShape>();

  void _init() {
    if (!this.matchShapes.isEmpty) {
      return;
    }
    this.matchShapes.add(Letters.B.bHeadBanbvrBaga);
    this.matchShapes.add(Letters.B.bMiddleBanbvrBaga);
    this.matchShapes.add(Letters.P.pHeadChihiBaga);
    this.matchShapes.add(Letters.P.pMiddleChihiBaga);
    this.matchShapes.add(Letters.F.fHeadChihiBaga);
    this.matchShapes.add(Letters.F.fMiddleChihiBaga);
    this.matchShapes.add(Letters.K.kHeadBaga);
    this.matchShapes.add(Letters.K.kMiddleBaga);
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
