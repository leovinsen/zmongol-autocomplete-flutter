import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_behind_rule.dart';

class BehindLikeHeadBanbvrIhB implements SplicingAtBehindRule {
  final matchShapes = new Set<LetterShape>();

  void _init() {
    if (!matchShapes.isEmpty) {
      return;
    }
    matchShapes.add(Letters.o.oTailGedes);
    matchShapes.add(Letters.u.uMiddleGedes);
    matchShapes.add(Letters.u.uMiddleGedesSilbi);
    matchShapes.add(Letters.u.uTailGedes);
    matchShapes.add(Letters.u.uTailGedesSuul1);
    matchShapes.add(Letters.o.oMiddleGedes);
  }

  @override
  bool match(LetterShape? ls) {
    _init();
    if (ls == null) {
      return false;
    }
    return matchShapes.contains(ls);
  }
}
