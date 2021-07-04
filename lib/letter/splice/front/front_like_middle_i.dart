import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeMiddleI implements SplicingAtFrontRule {
  final Set<LetterShape> notMatchShapes;

  FrontLikeMiddleI() : this.notMatchShapes = Set<LetterShape>();

  void _init() {
    if (!this.notMatchShapes.isEmpty) {
      return;
    }
    this.notMatchShapes.add(Letters.a.aHead);
    this.notMatchShapes.add(Letters.a.aMiddle);
    this.notMatchShapes.add(Letters.e.eHead);
    this.notMatchShapes.add(Letters.e.eMiddle);
//        this.notMatchShapes.add(Letters.O.oHeadGedes);
    this.notMatchShapes.add(Letters.o.oHeadTitemGedes);
    this.notMatchShapes.add(Letters.o.oMiddleGedes);
    this.notMatchShapes.add(Letters.u.uMiddleGedes);
    this.notMatchShapes.add(Letters.b.bHeadBanbvrIh);
    this.notMatchShapes.add(Letters.b.bMiddleBanbvrIh);
    this.notMatchShapes.add(Letters.p.pHeadChihiIh);
    this.notMatchShapes.add(Letters.p.pMiddleChihiIh);
    this.notMatchShapes.add(Letters.h.hHeadHunhur);
    this.notMatchShapes.add(Letters.h.hHeadHanhar);
    this.notMatchShapes.add(Letters.h.hMiddleHunhur);
    this.notMatchShapes.add(Letters.h.hMiddleDoubleAchvg);
    this.notMatchShapes.add(Letters.g.gHeadHanhar);
    this.notMatchShapes.add(Letters.g.gHeadHunhur);
    this.notMatchShapes.add(Letters.g.gMiddleHunhur);
    this.notMatchShapes.add(Letters.g.gMiddleDoubleAchvg);
    this.notMatchShapes.add(Letters.g.gMiddleDoubleNAchvg);
    this.notMatchShapes.add(Letters.f.fHeadChihiIh);
    this.notMatchShapes.add(Letters.f.fMiddleChihiIh);
    this.notMatchShapes.add(Letters.k.kHeadIh);
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
