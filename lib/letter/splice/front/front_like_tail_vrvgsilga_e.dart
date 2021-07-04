import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeTailVrvgsilgaE implements SplicingAtFrontRule {
  final Set<LetterShape> matchShapes;

  FrontLikeTailVrvgsilgaE() : this.matchShapes = Set<LetterShape>();

  void _init() {
    if (!this.matchShapes.isEmpty) {
      return;
    }
    this.matchShapes.add(Letters.b.bHeadBanbvrBaga);
    this.matchShapes.add(Letters.b.bMiddleBanbvrBaga);
    this.matchShapes.add(Letters.p.pHeadChihiBaga);
    this.matchShapes.add(Letters.p.pMiddleChihiBaga);
    this.matchShapes.add(Letters.h.hHeadHinhir);
    this.matchShapes.add(Letters.h.hMiddleHinhir);
    this.matchShapes.add(Letters.f.fHeadChihiBaga);
    this.matchShapes.add(Letters.f.fMiddleChihiBaga);
    this.matchShapes.add(Letters.k.kHeadBaga);
    this.matchShapes.add(Letters.k.kMiddleBaga);
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
