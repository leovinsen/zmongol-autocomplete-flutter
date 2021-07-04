import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeMiddleII implements SplicingAtFrontRule {
  final Set<LetterShape> matchShapes;

  FrontLikeMiddleII() : this.matchShapes = Set<LetterShape>();

  void _init() {
    if (!this.matchShapes.isEmpty) {
      return;
    }
    this.matchShapes.add(Letters.a.aHead);
    this.matchShapes.add(Letters.a.aMiddle);
    this.matchShapes.add(Letters.e.eHead);
    this.matchShapes.add(Letters.e.eMiddle);
//        this.matchShapes.add(Letters.O.oHeadGedes);
    this.matchShapes.add(Letters.o.oHeadTitemGedes);
    this.matchShapes.add(Letters.o.oMiddleGedes);
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
