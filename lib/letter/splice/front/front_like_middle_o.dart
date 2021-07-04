import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeMiddleO implements SplicingAtFrontRule {
  final Set<LetterShape> notMatchShapes;

  FrontLikeMiddleO() : this.notMatchShapes = Set<LetterShape>();

  void _init() {
    if (!this.notMatchShapes.isEmpty) {
      return;
    }
    this.notMatchShapes.add(Letters.B.bHeadBanbvrBaga);
    this.notMatchShapes.add(Letters.B.bMiddleBanbvrBaga);
    this.notMatchShapes.add(Letters.P.pHeadChihiBaga);
    this.notMatchShapes.add(Letters.P.pMiddleChihiBaga);
    this.notMatchShapes.add(Letters.H.hHeadHinhir);
    this.notMatchShapes.add(Letters.H.hHeadHunhur);
    this.notMatchShapes.add(Letters.H.hMiddleHinhir);
    this.notMatchShapes.add(Letters.H.hMiddleHunhur);

    this.notMatchShapes.add(Letters.G.gHeadHinhir);
    this.notMatchShapes.add(Letters.G.gHeadHunhur);
    this.notMatchShapes.add(Letters.G.gMiddleHunhur);
    this.notMatchShapes.add(Letters.G.gMiddleHinhir);

    this.notMatchShapes.add(Letters.F.fHeadChihiBaga);
    this.notMatchShapes.add(Letters.F.fMiddleChihiBaga);
    this.notMatchShapes.add(Letters.K.kHeadBaga);
    this.notMatchShapes.add(Letters.K.kMiddleBaga);
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
