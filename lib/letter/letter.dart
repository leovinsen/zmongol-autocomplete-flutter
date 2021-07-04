import 'package:ime_mongol_package/letter/letter_shape.dart';

abstract class Letter {
  final String latinKey;

  Letter(this.latinKey);

  String getLatinKey() {
    return latinKey;
  }

  List<LetterShape> getLetterShapes();
}
