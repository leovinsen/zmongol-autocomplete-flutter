import 'package:ime_mongol_package/keyboard/keyboard_layout.dart';
import 'package:ime_mongol_package/letter/letter_location.dart';
import 'package:ime_mongol_package/letter/letter_shape.dart';
import 'package:ime_mongol_package/letter/letter_shape_sequence.dart';
import 'package:ime_mongol_package/letter/splice/verifier.dart';

class LetterSplicer {
  List<LetterShapeSequence> fuzzy(List<String> latinSequence) {
    int time1 = DateTime.now().millisecondsSinceEpoch;
    try {
      if (latinSequence.isEmpty) {
        return [];
      }
      var completeLssList = <LetterShapeSequence>[];
      int i = 0;
      for (String key in latinSequence) {
        var letterShapeList = <LetterShape>[];
        if (i == 0) {
          letterShapeList.addAll(KeyboardLayout.get(key, LetterLocation.HEAD));
        } else if (i == latinSequence.length - 1) {
          letterShapeList
              .addAll(KeyboardLayout.get(key, LetterLocation.MIDDLE));
          letterShapeList.addAll(KeyboardLayout.get(key, LetterLocation.TAIL));
        } else {
          letterShapeList
              .addAll(KeyboardLayout.get(key, LetterLocation.MIDDLE));
        }
        i++;

        if (letterShapeList == null || letterShapeList.isEmpty) {
          continue;
        }
        int size = (completeLssList.length > 0 ? completeLssList.length : 1) *
            letterShapeList.length;
        List<LetterShapeSequence> newWholeLssList =
            List.generate(size, (index) => LetterShapeSequence());

        LetterShapeSequence lss;
        if (completeLssList == null || completeLssList.isEmpty) {
          for (LetterShape letterShape in letterShapeList) {
            if (Verifier.canFuzzySplicing(
                LetterShapeSequence.emptyLss, letterShape)) {
              lss = new LetterShapeSequence();
              lss.append(letterShape);
              newWholeLssList.add(lss);
            } else {
              print('ignored ${letterShape.toString()}');
            }
          }
        } else {
          for (LetterShape letterShape in letterShapeList) {
            for (LetterShapeSequence clss in completeLssList) {
              if (Verifier.canFuzzySplicing(clss, letterShape)) {
                lss = new LetterShapeSequence();
                lss.appendSequence(clss);
                lss.append(letterShape);
                newWholeLssList.add(lss);
              } else {
                print('ignored ${clss.toString}, ${letterShape.toString()}');
              }
            }
          }
        }
        completeLssList = newWholeLssList;
      }
      return completeLssList;
    } finally {
      print(
          "latin to zcode run time: ${DateTime.now().millisecondsSinceEpoch - time1}");
    }
  }

  List<LetterShapeSequence> severe(List<String> latinSequence) {
    int time1 = DateTime.now().millisecondsSinceEpoch;
    try {
      if (latinSequence == null || latinSequence.isEmpty) {
        return List.empty();
      }
      List<LetterShapeSequence> completeLssList = [];
      int i = 0;
      for (String key in latinSequence) {
        List<LetterShape> letterShapeList = [];
        if (i == 0) {
          letterShapeList.addAll(KeyboardLayout.get(key, LetterLocation.HEAD));
        } else if (i == latinSequence.length - 1) {
          letterShapeList.addAll(KeyboardLayout.get(key, LetterLocation.TAIL));
        } else {
          letterShapeList
              .addAll(KeyboardLayout.get(key, LetterLocation.MIDDLE));
        }
        i++;

        if (letterShapeList == null || letterShapeList.isEmpty) {
          continue;
        }
        int size = (completeLssList.length > 0 ? completeLssList.length : 1) *
            letterShapeList.length;
        List<LetterShapeSequence> newWholeLssList = [];

        LetterShapeSequence lss;
        if (completeLssList == null || completeLssList.isEmpty) {
          for (LetterShape letterShape in letterShapeList) {
            if (Verifier.canSevereSplicing(
                LetterShapeSequence.emptyLss, letterShape)) {
              lss = new LetterShapeSequence();
              lss.append(letterShape);
              newWholeLssList.add(lss);
            } else {
              print('ignored :$letterShape');
            }
          }
        } else {
          for (LetterShape letterShape in letterShapeList) {
            for (LetterShapeSequence clss in completeLssList) {
              if (Verifier.canSevereSplicing(clss, letterShape)) {
                lss = new LetterShapeSequence();
                lss.appendSequence(clss);
                lss.append(letterShape);
                newWholeLssList.add(lss);
              } else {
                print('ignored ${clss.toString}, ${letterShape.toString()}');
              }
            }
          }
        }
        completeLssList = newWholeLssList;
      }
      return completeLssList;
    } finally {
      print(
          "latin to zcode run time: ${DateTime.now().millisecondsSinceEpoch - time1}");
    }
  }
}
