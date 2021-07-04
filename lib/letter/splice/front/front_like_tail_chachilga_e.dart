import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeTailChachilgaE implements SplicingAtFrontRule {
  final Set<LetterShape> matchShapes;

  FrontLikeTailChachilgaE() : this.matchShapes = Set<LetterShape>();

  void _init() {
    if (!this.matchShapes.isEmpty) {
      return;
    }
    this.matchShapes.add(Letters.N.nMiddleNOrhich);
    this.matchShapes.add(Letters.G.gMiddleDvsaltaiAgsilga);
    this.matchShapes.add(Letters.M.mMiddleHurbelge);
    this.matchShapes.add(Letters.L.lMiddleHurbelge);
    this.matchShapes.add(Letters.Y.yMiddleHvms);
    this.matchShapes.add(Letters.R.rMiddleSuul);
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
