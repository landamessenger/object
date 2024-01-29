import 'default_value.dart';

class Field {
  /// Sets the current field as the primary key which will difference that
  /// instance of others.
  final bool primary;

  /// Sets if the current field should have a basic de/serialization.
  ///
  /// toJson() -> 'field': instance['field']
  ///
  /// fromJson() -> instance['field'] = json['field']
  ///
  final bool basic;

  /// Defines the current field for being recycle on the deserialization
  /// process. Instead of create a new instance of the field, the library will
  /// use the old one, for avoiding memory consumption.
  ///
  /// This field only applies on complex instances, not on primitive types.
  final bool recycle;

  /// Key for de/serialization
  final String name;

  /// Helps de/serializing instances whose classes are not managed by the
  /// library.
  final String import;

  /// Default value for primitive types.
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
