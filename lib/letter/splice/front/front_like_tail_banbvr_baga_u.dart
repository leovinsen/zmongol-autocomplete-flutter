import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeTailBanbvrBagaU implements SplicingAtFrontRule {
  final Set<LetterShape> notMatchShapes;

  FrontLikeTailBanbvrBagaU() : this.notMatchShapes = Set<LetterShape>();

  void _init() {
    if (!this.notMatchShapes.isEmpty) {
      return;
    }
    this.notMatchShapes.add(Letters.n.nMiddleAchvg);
    this.notMatchShapes.add(Letters.b.bHeadBanbvrBaga);
    this.notMatchShapes.add(Letters.b.bHeadBanbvrIh);
    this.notMatchShapes.add(Letters.b.bMiddleBanbvrBaga);
    this.notMatchShapes.add(Letters.b.bMiddleBanbvrIh);
    this.notMatchShapes.add(Letters.p.pHeadChihiBaga);
    this.notMatchShapes.add(Letters.p.pHeadChihiIh);
    this.notMatchShapes.add(Letters.p.pMiddleChihiBaga);
    this.notMatchShapes.add(Letters.p.pMiddleChihiIh);
    this.notMatchShapes.add(Letters.h.hHeadHinhir);
    this.notMatchShapes.add(Letters.h.hHeadHunhur);
    this.notMatchShapes.add(Letters.h.hHeadHanhar);
    this.notMatchShapes.add(Letters.h.hMiddleHinhir);
    this.notMatchShapes.add(Letters.h.hMiddleHunhur);
    this.notMatchShapes.add(Letters.h.hMiddleDoubleAchvg);
    this.notMatchShapes.add(Letters.g.gHeadHinhir);
    this.notMatchShapes.add(Letters.g.gHeadHunhur);
    this.notMatchShapes.add(Letters.g.gHeadHanhar);
    this.notMatchShapes.add(Letters.g.gMiddleHinhir);
    this.notMatchShapes.add(Letters.g.gMiddleHunhur);
    this.notMatchShapes.add(Letters.g.gMiddleDoubleAchvg);
    this.notMatchShapes.add(Letters.g.gMiddleDoubleNAchvg);
    this.notMatchShapes.add(Letters.f.fHeadChihiBaga);
    this.notMatchShapes.add(Letters.f.fHeadChihiIh);
    this.notMatchShapes.add(Letters.f.fMiddleChihiBaga);
    this.notMatchShapes.add(Letters.f.fMiddleChihiIh);
    this.notMatchShapes.add(Letters.k.kHeadBaga);
    this.notMatchShapes.add(Letters.k.kHeadIh);
    this.notMatchShapes.add(Letters.k.kMiddleBaga);
    this.notMatchShapes.add(Letters.k.kMiddleIh);
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
    return !this.notMatchShapes.contains(last);
  }
}
