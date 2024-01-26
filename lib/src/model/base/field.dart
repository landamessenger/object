class Field {
  final bool primary;
  final String name;
  final dynamic defaultValue;

  const Field({
    required this.name,
    this.defaultValue,
    this.primary = false,
  });
}
