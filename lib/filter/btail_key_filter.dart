import 'package:ime_mongol_package/filter/key_filter.dart';
import 'package:ime_mongol_package/letter/zcode.dart';

class BTailKeyFilter implements KeyFilter {
  @override
  String getKey() {
    return "b" + "-tail";
  }

  @override
  bool accept(String str) {
    var regex = "[^" +
        ZCode.b_banbvr_baga +
        ZCode.b_banbvr_ih +
        "]+[" +
        ZCode.b_banbvr_baga +
        ZCode.b_banbvr_ih +
        "]\$";

    return !RegExp(regex).hasMatch(str);
  }
}
