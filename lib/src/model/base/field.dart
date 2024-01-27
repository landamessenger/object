class Field {
  final bool primary;
  final String name;
  final String import;
  final dynamic defaultValue;

  const Field({
    required this.name,
    this.import = '',
    this.defaultValue,
    this.primary = false,
  });
}
