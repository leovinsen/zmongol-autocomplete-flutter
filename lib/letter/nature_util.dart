import 'letters.dart';
import 'nature.dart';

class NatureUtil {
  static Nature getNature(String latinKey) {
    if (latinKey.isEmpty) {
      return Nature.SAARMAG;
    }
    if ((latinKey == Letters.A.latinKey) || (latinKey == Letters.O.latinKey)) {
      return Nature.CHAGH;
    } else {
      if ((latinKey == Letters.E.latinKey) ||
          (latinKey == Letters.U.latinKey)) {
        return Nature.HUNDII;
      } else {
        return Nature.SAARMAG;
      }
    }
  }
}
