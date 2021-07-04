import 'letters.dart';
import 'nature.dart';

class NatureUtil {
  static Nature getNature(String latinKey) {
    if (latinKey.isEmpty) {
      return Nature.SAARMAG;
    }
    if ((latinKey == Letters.a.latinKey) || (latinKey == Letters.o.latinKey)) {
      return Nature.CHAGH;
    } else {
      if ((latinKey == Letters.e.latinKey) ||
          (latinKey == Letters.u.latinKey)) {
        return Nature.HUNDII;
      } else {
        return Nature.SAARMAG;
      }
    }
  }
}
