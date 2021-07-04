import 'letter_shape.dart';
import 'nature.dart';
import 'nature_util.dart';

class LetterShapeSequence {
  static final LetterShapeSequence emptyLss = new EmptyLss();

  final letterShapes = <LetterShape>[];

  Nature _nature;

  LetterShapeSequence() : this._nature = Nature.SAARMAG;

  Nature get nature => this._nature;

  void set nature(Nature ntr) {
    if (ntr == nature || ntr == Nature.SAARMAG) {
      return;
    }
    this._nature = ntr;
  }

  void append(LetterShape letterShape) {
    this._nature = NatureUtil.getNature(letterShape.getLatinKey());
    letterShapes.add(letterShape);
  }

  void appendSequence(LetterShapeSequence letterShapeSequence) {
    for (LetterShape letterShape in letterShapeSequence.letterShapes) {
      this.append(letterShape);
    }
  }

  bool isEmpty() {
    return letterShapes.isEmpty;
  }

  bool isNotEmpty() {
    return letterShapes.isNotEmpty;
  }

  int size() {
    return this.letterShapes.length;
  }

  String toString() {
    var s = "";
    for (LetterShape letterShape in this.letterShapes) {
      s += letterShape.getShape();
    }
    return s.toString();
  }

  LetterShape getLast() {
    return this.letterShapes[this.letterShapes.length - 1];
  }
}

class EmptyLss extends LetterShapeSequence {
  @override
  void append(LetterShape letterShape) {
    throw new UnsupportedError("Unsupported operation");
  }

  @override
  void appendSequence(LetterShapeSequence letterShapeSequence) {
    throw new UnsupportedError("Unsupported operation");
  }
}
