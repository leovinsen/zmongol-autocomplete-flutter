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
    "a": [Letters.a],
    "e": [Letters.e],
    "i": [Letters.i],
    "o": [Letters.o],
    "u": [Letters.u],
    "n": [Letters.n],
    "b": [Letters.b],
    "p": [Letters.p],
    "h": [Letters.h],
    "g": [Letters.g],
    "m": [Letters.m],
    "l": [Letters.l],
    "s": [Letters.s],
    "x": [Letters.x],
    "t": [Letters.t],
    "d": [Letters.d],
    "q": [Letters.q],
    "j": [Letters.j],
    "y": [Letters.y],
    "r": [Letters.r],
    "w": [Letters.w],
    "f": [Letters.f],
    "k": [Letters.k],
    "c": [Letters.c],
    "z": [Letters.z],
    "H": [Letters.galig_h],
    "R": [Letters.galig_r],
    "L": [Letters.galig_l],
    "Z": [Letters.galig_zh],
    "C": [Letters.galig_ch],
  };

  static List<LetterShape> get(String key, int letterLocation) {
    List<Letter>? letterList = keyMap[key];

    if (letterList == null || letterList.isEmpty) {
      return [];
    }

    List<LetterShape> letterShapeList = [];

    letterList.forEach((letter) {
      var temp = letter.getLetterShapes();
      for (LetterShape ls in temp) {
        if (ls.getLocation() == letterLocation) {
          letterShapeList.add(ls);
        }
      }
    });

    return letterShapeList;
  }

  static Set<String> getKeys() {
    return Set.from(KEYS);
  }
}
