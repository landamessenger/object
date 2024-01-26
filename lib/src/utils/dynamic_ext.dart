import 'package:object/src/manager/manager.dart';

extension DynamicExt on dynamic {
  Map<String, dynamic> asMap() => ObjectManager().internalLinkerToMap(this);
}
