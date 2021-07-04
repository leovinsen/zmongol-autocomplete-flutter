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
    this.notMatchShapes.add(Letters.A.aHead);
    this.notMatchShapes.add(Letters.A.aMiddle);
    this.notMatchShapes.add(Letters.E.eHead);
    this.notMatchShapes.add(Letters.E.eMiddle);
//        this.notMatchShapes.add(Letters.O.oHeadGedes);
    this.notMatchShapes.add(Letters.O.oHeadTitemGedes);
    this.notMatchShapes.add(Letters.O.oMiddleGedes);
    this.notMatchShapes.add(Letters.U.uMiddleGedes);
    this.notMatchShapes.add(Letters.B.bHeadBanbvrIh);
    this.notMatchShapes.add(Letters.B.bMiddleBanbvrIh);
    this.notMatchShapes.add(Letters.P.pHeadChihiIh);
    this.notMatchShapes.add(Letters.P.pMiddleChihiIh);
    this.notMatchShapes.add(Letters.H.hHeadHunhur);
    this.notMatchShapes.add(Letters.H.hHeadHanhar);
    this.notMatchShapes.add(Letters.H.hMiddleHunhur);
    this.notMatchShapes.add(Letters.H.hMiddleDoubleAchvg);
    this.notMatchShapes.add(Letters.G.gHeadHanhar);
    this.notMatchShapes.add(Letters.G.gHeadHunhur);
    this.notMatchShapes.add(Letters.G.gMiddleHunhur);
    this.notMatchShapes.add(Letters.G.gMiddleDoubleAchvg);
    this.notMatchShapes.add(Letters.G.gMiddleDoubleNAchvg);
    this.notMatchShapes.add(Letters.F.fHeadChihiIh);
    this.notMatchShapes.add(Letters.F.fMiddleChihiIh);
    this.notMatchShapes.add(Letters.K.kHeadIh);
    this.notMatchShapes.add(Letters.K.kMiddleIh);
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
