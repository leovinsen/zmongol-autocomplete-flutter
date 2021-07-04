import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeTailSilbiSuul1I implements SplicingAtFrontRule {
  final Set<LetterShape> matchShapes;

  FrontLikeTailSilbiSuul1I() : this.matchShapes = Set<LetterShape>();

  void _init() {
    if (!this.matchShapes.isEmpty) {
      return;
    }
    matchShapes.add(Letters.B.bHeadBanbvrBaga);
    matchShapes.add(Letters.B.bMiddleBanbvrBaga);
    matchShapes.add(Letters.P.pHeadChihiBaga);
    matchShapes.add(Letters.P.pMiddleChihiBaga);
    matchShapes.add(Letters.H.hHeadHinhir);
    matchShapes.add(Letters.H.hMiddleHinhir);
    matchShapes.add(Letters.G.gHeadHinhir);
    matchShapes.add(Letters.G.gMiddleHinhir);
    matchShapes.add(Letters.F.fHeadChihiBaga);
    matchShapes.add(Letters.F.fMiddleChihiBaga);
    matchShapes.add(Letters.K.kHeadBaga);
    matchShapes.add(Letters.K.kMiddleBaga);
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
