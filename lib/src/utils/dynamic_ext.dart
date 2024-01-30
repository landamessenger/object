import 'package:object/src/manager/manager.dart';

extension DynamicExt<T extends Object> on T {
  Map<String, dynamic> asMap() => ObjectManager().internalLinkerToMap(this);
}
