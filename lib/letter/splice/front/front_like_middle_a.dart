import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeMiddleA implements SplicingAtFrontRule {
  final Set<LetterShape> notMatchShapes;

  FrontLikeMiddleA() : this.notMatchShapes = Set<LetterShape>();

  void _init() {
    if (!this.notMatchShapes.isEmpty) {
      return;
    }
    this.notMatchShapes.add(Letters.B.bHeadBanbvrIh);
    this.notMatchShapes.add(Letters.B.bMiddleBanbvrIh);
    this.notMatchShapes.add(Letters.P.pHeadChihiIh);
    this.notMatchShapes.add(Letters.P.pMiddleChihiIh);
    this.notMatchShapes.add(Letters.H.hHeadHunhur);
    this.notMatchShapes.add(Letters.H.hMiddleHunhur);
    this.notMatchShapes.add(Letters.H.hHeadHinhir);
    this.notMatchShapes.add(Letters.H.hMiddleHinhir);
    this.notMatchShapes.add(Letters.G.gHeadHunhur);
    this.notMatchShapes.add(Letters.G.gHeadHinhir);
    this.notMatchShapes.add(Letters.G.gMiddleHinhir);
    this.notMatchShapes.add(Letters.G.gMiddleHunhur);
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
