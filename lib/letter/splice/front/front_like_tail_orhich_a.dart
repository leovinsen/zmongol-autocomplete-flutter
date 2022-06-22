import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_front_rule.dart';

class FrontLikeTailOrhichA implements SplicingAtFrontRule {
  final Set<LetterShape> matchShapes;

  FrontLikeTailOrhichA() : this.matchShapes = Set<LetterShape>();

  void _init() {
    if (!this.matchShapes.isEmpty) {
      return;
    }
    this.matchShapes.add(Letters.a.aHead);
    this.matchShapes.add(Letters.a.aMiddle);
    this.matchShapes.add(Letters.i.iHead);
    this.matchShapes.add(Letters.i.iMiddle);
    this.matchShapes.add(Letters.o.oHeadTitemGedes);
    this.matchShapes.add(Letters.o.oMiddleGedes);
    this.matchShapes.add(Letters.n.nHead);
    this.matchShapes.add(Letters.n.nMiddleNAchvg);
    this.matchShapes.add(Letters.h.hHeadHanhar);
    this.matchShapes.add(Letters.g.gHeadHanhar);
    this.matchShapes.add(Letters.m.mHead);
    this.matchShapes.add(Letters.m.mMiddleAchvg);
    this.matchShapes.add(Letters.l.lHead);
    this.matchShapes.add(Letters.l.lMiddleAchvg);
    this.matchShapes.add(Letters.s.sHead);
    this.matchShapes.add(Letters.s.sMiddle);
    this.matchShapes.add(Letters.x.xHead);
    this.matchShapes.add(Letters.x.xMidddle);
    this.matchShapes.add(Letters.t.tHead);
    this.matchShapes.add(Letters.t.tMiddleDSenj);
    this.matchShapes.add(Letters.t.tMiddleTSenj);
    this.matchShapes.add(Letters.d.dHeadDSenj);
    this.matchShapes.add(Letters.d.dMiddleDSenj);
    this.matchShapes.add(Letters.q.qHead);
    this.matchShapes.add(Letters.q.qMiddle);
    this.matchShapes.add(Letters.j.jHead);
    this.matchShapes.add(Letters.j.jMiddle);
    this.matchShapes.add(Letters.y.yHead);
    this.matchShapes.add(Letters.y.yMiddleErtegerSilbi);
    this.matchShapes.add(Letters.r.rHead);
    this.matchShapes.add(Letters.r.rMiddleErbgeljinSilbi);
    this.matchShapes.add(Letters.w.wHead);
    this.matchShapes.add(Letters.w.wMiddle);
    this.matchShapes.add(Letters.c.cHead);
    this.matchShapes.add(Letters.c.cMiddle);
    this.matchShapes.add(Letters.z.zHead);
    this.matchShapes.add(Letters.z.zMiddle);
    this.matchShapes.add(Letters.galig_h.galigHHead);
    this.matchShapes.add(Letters.galig_h.galigHMiddle);
    this.matchShapes.add(Letters.galig_r.galigRHead);
    this.matchShapes.add(Letters.galig_l.galigLHead);
    this.matchShapes.add(Letters.galig_zh.galigZhHead);
    this.matchShapes.add(Letters.galig_ch.galigChHead);
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
