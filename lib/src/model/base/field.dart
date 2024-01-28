import 'default_value.dart';

class Field {
  final bool primary;
  final bool basic;
  final bool recycle;
  final String name;
  final String import;
  final DefaultValue? defaultValue;

  const Field({
    required this.name,
    this.import = '',
    this.defaultValue,
    this.primary = false,
    this.basic = false,
    this.recycle = false,
  });
}
