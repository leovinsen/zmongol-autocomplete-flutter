import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontTailGedesSuul1U implements SplicingAtFrontRule {
  final Set<LetterShape> notMatchShapes;

  FrontTailGedesSuul1U() : this.notMatchShapes = Set<LetterShape>();

  void _init() {
    if (!this.notMatchShapes.isEmpty) {
      return;
    }
    this.notMatchShapes.add(Letters.h.hHeadHinhir);
    this.notMatchShapes.add(Letters.h.hHeadHanhar);
    this.notMatchShapes.add(Letters.g.gHeadHinhir);
    this.notMatchShapes.add(Letters.g.gHeadHanhar);
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
