class BlackSequence {
  final int id;
  final String str;

  BlackSequence(this.id, this.str);

  factory BlackSequence.fromMap(Map<String, dynamic> map) =>
      BlackSequence(map['id'], map['str']);
}
