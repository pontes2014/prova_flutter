class DataModel {
  final String text;

  DataModel(this.text);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModel && runtimeType == other.runtimeType && text == other.text;

  @override
  int get hashCode => text.hashCode;
}
