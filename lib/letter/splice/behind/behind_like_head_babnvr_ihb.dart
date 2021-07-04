import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letters.dart';
import 'package:ime_mongol_package/letter/splice/splicing_at_behind_rule.dart';

class BehindLikeHeadBanbvrIhB implements SplicingAtBehindRule {
  final matchShapes = new Set<String>();

  void _init() {
    if (!matchShapes.isEmpty) {
      return;
    }
    matchShapes.add(Letters.O.oTailGedes);
    matchShapes.add(Letters.U.uMiddleGedes);
    matchShapes.add(Letters.U.uMiddleGedesSilbi);
    matchShapes.add(Letters.U.uTailGedes);
    matchShapes.add(Letters.U.uTailGedesSuul1);
    matchShapes.add(Letters.O.oMiddleGedes);
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
