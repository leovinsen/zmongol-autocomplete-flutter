import 'splice/splicing_at_behind_rule.dart';
import 'splice/splicing_at_front_rule.dart';
import 'unmodifiable_letter_shape.dart';

class LetterShape {
  final String latinKey;
  final String shape;
  final int location;
  SplicingAtFrontRule? fuzzyFrontAtRule;
  SplicingAtBehindRule? fuzzyBehindAtRule;
  SplicingAtFrontRule? severeFrontAtRule;
  SplicingAtBehindRule? severeBehindAtRule;

  LetterShape(this.latinKey, this.shape, this.location);

  String getLatinKey() {
    return latinKey;
  }

  String getShape() {
    return shape;
  }

  int getLocation() {
    return location;
  }

  bool equals(Object o) {
    return identical(this, o) ||
        o is LetterShape &&
            runtimeType == o.runtimeType &&
            location == o.location &&
            latinKey == o.latinKey &&
            shape == o.shape;
  }

  @override
  String toString() {
    return this.latinKey + "_" + this.location.toString() + "_" + this.shape;
  }

  SplicingAtFrontRule? getFuzzyFrontAtRule() {
    return fuzzyFrontAtRule;
  }

  void setFuzzyFrontAtRule(SplicingAtFrontRule? fuzzyFrontAtRule) {
    this.fuzzyFrontAtRule = fuzzyFrontAtRule;
  }

  SplicingAtBehindRule? getFuzzyBehindAtRule() {
    return fuzzyBehindAtRule;
  }

  void setFuzzyBehindAtRule(SplicingAtBehindRule? fuzzyBehindAtRule) {
    this.fuzzyBehindAtRule = fuzzyBehindAtRule;
  }

  SplicingAtFrontRule? getSevereFrontAtRule() {
    return severeFrontAtRule;
  }

  void setSevereFrontAtRule(SplicingAtFrontRule? severeFrontAtRule) {
    this.severeFrontAtRule = severeFrontAtRule;
  }

  SplicingAtBehindRule? getSevereBehindAtRule() {
    return severeBehindAtRule;
  }

  void setSevereBehindAtRule(SplicingAtBehindRule? severeBehindAtRule) {
    this.severeBehindAtRule = severeBehindAtRule;
  }

  LetterShape newUnmodifiable() {
    return new UnmodifiableLetterShape(this);
  }
}
