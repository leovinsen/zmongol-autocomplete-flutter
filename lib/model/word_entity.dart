import 'mount_object.dart';

class WordEntity implements MountObject {
  final int id;
  final String str;
  final int length;
  int frequency;

  WordEntity(this.id, this.str, this.frequency) : this.length = str.length;

  factory WordEntity.fromMap(Map<String, dynamic> map) =>
      WordEntity(map['id'], map['str'], map['frequency']);

  factory WordEntity.fromString(String str) => WordEntity(0, str, 0);

  void incrementFrequency() {
    frequency++;
  }

  void addFrequency(int number) {
    this.frequency += number;
  }

  @override
  String getString() => str;
}
