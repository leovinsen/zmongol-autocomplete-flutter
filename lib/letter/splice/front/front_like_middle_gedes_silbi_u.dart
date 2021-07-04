import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeMiddleGedesSilbiU implements SplicingAtFrontRule {
  final Set<LetterShape> notMatchShapes;

  FrontLikeMiddleGedesSilbiU() : this.notMatchShapes = Set<LetterShape>();

  void _init() {
    if (!this.notMatchShapes.isEmpty) {
      return;
    }
    this.notMatchShapes.add(Letters.B.bHeadBanbvrBaga);
    this.notMatchShapes.add(Letters.P.pHeadChihiBaga);
    this.notMatchShapes.add(Letters.H.hHeadHanhar);
    this.notMatchShapes.add(Letters.H.hHeadHinhir);
    this.notMatchShapes.add(Letters.G.gHeadHanhar);
    this.notMatchShapes.add(Letters.G.gHeadHinhir);
    this.notMatchShapes.add(Letters.F.fHeadChihiBaga);
    this.notMatchShapes.add(Letters.K.kHeadBaga);
  }

  @override
  bool match(LetterShapeSequence lss) {
    this._init();
    if (lss.isEmpty()) {
      return false;
    }
    LetterShape last = lss.getLast();
    if (last == null || last.getLocation() != LetterLocation.HEAD) {
      return false;
    }
    return !this.notMatchShapes.contains(last);
  }
}
