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
    matchShapes.add(Letters.b.bHeadBanbvrBaga);
    matchShapes.add(Letters.b.bMiddleBanbvrBaga);
    matchShapes.add(Letters.p.pHeadChihiBaga);
    matchShapes.add(Letters.p.pMiddleChihiBaga);
    matchShapes.add(Letters.h.hHeadHinhir);
    matchShapes.add(Letters.h.hMiddleHinhir);
    matchShapes.add(Letters.g.gHeadHinhir);
    matchShapes.add(Letters.g.gMiddleHinhir);
    matchShapes.add(Letters.f.fHeadChihiBaga);
    matchShapes.add(Letters.f.fMiddleChihiBaga);
    matchShapes.add(Letters.k.kHeadBaga);
    matchShapes.add(Letters.k.kMiddleBaga);
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
