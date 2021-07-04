import 'letter_shape.dart';
import 'splice/splicing_at_behind_rule.dart';
import 'splice/splicing_at_front_rule.dart';

class UnmodifiableLetterShape extends LetterShape {
  UnmodifiableLetterShape(LetterShape letterShape)
      : super(letterShape.latinKey, letterShape.shape, letterShape.location) {
    this.fuzzyFrontAtRule = letterShape.fuzzyFrontAtRule;
    this.fuzzyBehindAtRule = letterShape.fuzzyBehindAtRule;
    this.severeFrontAtRule = letterShape.severeFrontAtRule;
    this.severeBehindAtRule = letterShape.severeBehindAtRule;
  }

  @override
  void setFuzzyFrontAtRule(SplicingAtFrontRule? fuzzyFrontAtRule) {
    throw new UnsupportedError("Unsupported operation");
  }

  @override
  void setFuzzyBehindAtRule(SplicingAtBehindRule? fuzzyBehindAtRule) {
    throw new UnsupportedError("Unsupported operation");
  }

  @override
  void setSevereFrontAtRule(SplicingAtFrontRule? severeFrontAtRule) {
    throw new UnsupportedError("Unsupported operation");
  }

  @override
  void setSevereBehindAtRule(SplicingAtBehindRule? severeBehindAtRule) {
    throw new UnsupportedError("Unsupported operation");
  }
}
