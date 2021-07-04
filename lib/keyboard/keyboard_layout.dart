import 'package:ime_mongol_package/letter/letter.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letters.dart';

class KeyboardLayout {
  static const List<String> KEYS = [
    "a",
    "e",
    "i",
    "o",
    "u",
    "n",
    "b",
    "p",
    "h",
    "g",
    "m",
    "l",
    "s",
    "x",
    "t",
    "d",
    "q",
    "j",
    "y",
    "r",
    "w",
    "f",
    "k",
    "c",
    "z",
    "H",
    "R",
    "L",
    "Z",
    "C"
  ];

  static Map<String, List<Letter>> keyMap = {
    "a": Letters.A,
    "e": Letters.E,
    "i": Letters.I,
    "o": Letters.O,
    "u": Letters.U,
    "n": Letters.N,
    "b": Letters.B,
    "p": Letters.P,
    "h": Letters.H,
    "g": Letters.G,
    "m": Letters.M,
    "l": Letters.L,
    "s": Letters.S,
    "x": Letters.X,
    "t": Letters.T,
    "d": Letters.D,
    "q": Letters.Q,
    "j": Letters.J,
    "y": Letters.Y,
    "r": Letters.R,
    "w": Letters.W,
    "f": Letters.F,
    "k": Letters.K,
    "c": Letters.C,
    "z": Letters.Z,
    "H": Letters.GALIG_H,
    "R": Letters.GALIG_R,
    "L": Letters.GALIG_L,
    "Z": Letters.GALIG_ZH,
    "C": Letters.GALIG_CH,
  };

  static List<LetterShape> get(String key, int letterLocation) {
    List<Letter>? letterList = keyMap[key];

    if (letterList == null || letterList.isEmpty) {
      return [];
    }

    List<LetterShape> letterShapeList = [];
    letterList.forEach((letter) {
      letterShapeList.addAll(letter.getLetterShapes());
    });

    return letterShapeList;
  }

  static Set<String> getKeys() {
    return Set.from(KEYS);
  }
}
