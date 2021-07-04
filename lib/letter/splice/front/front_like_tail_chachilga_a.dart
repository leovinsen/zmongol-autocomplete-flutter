import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rul\e.dart';

class FrontLikeTailChachilgaA implements SplicingAtFrontRule {
  final Set<LetterShape> matchShapes;

  FrontLikeTailChachilgaA() : this.matchShapes = Set<LetterShape>();

  void _init() {
    if (!this.matchShapes.isEmpty) {
      return;
    }
    this.matchShapes.add(Letters.o.oMiddleBanbvrBaga);
    this.matchShapes.add(Letters.n.nMiddleNOrhich);
    this.matchShapes.add(Letters.h.hMiddleAgsilga);
    this.matchShapes.add(Letters.g.gMiddleDvsaltaiAgsilga);
    this.matchShapes.add(Letters.g.gMiddleAgsilga);
    this.matchShapes.add(Letters.m.mMiddleHurbelge);
    this.matchShapes.add(Letters.l.lMiddleHurbelge);
    this.matchShapes.add(Letters.y.yMiddleHvms);
    this.matchShapes.add(Letters.r.rMiddleSuul);
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
