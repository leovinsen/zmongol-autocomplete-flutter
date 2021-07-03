class WordEntity {
  final int id;
  final String str;
  final int length;
  int frequency;

  WordEntity(this.id, this.str, this.frequency) : this.length = str.length;

  void incrementFrequency() {
    frequency++;
  }

  void addFrequency(int number) {
    this.frequency += number;
  }
}
