import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeMiddleGedesU implements SplicingAtFrontRule {
  final Set<LetterShape> notMatchShapes;

  FrontLikeMiddleGedesU() : this.notMatchShapes = Set<LetterShape>();

  void _init() {
    if (!this.notMatchShapes.isEmpty) {
      return;
    }
    this.notMatchShapes.add(Letters.B.bMiddleBanbvrBaga);
    this.notMatchShapes.add(Letters.P.pMiddleChihiBaga);
    this.notMatchShapes.add(Letters.H.hMiddleHinhir);
    this.notMatchShapes.add(Letters.H.hMiddleDoubleAchvg);
    this.notMatchShapes.add(Letters.G.gMiddleHinhir);
    this.notMatchShapes.add(Letters.G.gMiddleDoubleNAchvg);
    this.notMatchShapes.add(Letters.G.gMiddleDoubleAchvg);
    this.notMatchShapes.add(Letters.F.fMiddleChihiBaga);
    this.notMatchShapes.add(Letters.K.kMiddleBaga);
  }

  @override
  bool match(LetterShapeSequence lss) {
    this._init();
    if (lss.isEmpty()) {
      return false;
    }
    LetterShape last = lss.getLast();
    if (last == null || last.getLocation() != LetterLocation.MIDDLE) {
      return false;
    }
    return !this.notMatchShapes.contains(last);
  }
}
