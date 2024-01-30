import 'package:object/src/manager/manager.dart';
import 'package:object/src/model/base/object.dart' as object;
import 'package:object/src/utils/data_ext.dart';
import 'package:object/src/utils/print.dart';

extension DataKeyExt on Map<String, dynamic>? {
  Object? getField(String key) {
    try {
      final data = this;
      if (data == null) {
        return null;
      }
      final map = ObjectManager().normalizeMap(data);
      return map[key];
    } catch (e) {
      printDebug('Error on getField $runtimeType');
      printDebug(e);
      return null;
    }
  }

  /// Nullable getters
  String? getStringFieldBy(String key) {
    return getField(key).asNullableString();
  }

  bool? getBooleanFieldBy(String key) => getField(key).asNullableBool();

  num? getNumFieldBy(String key) => getField(key).asNullableNum();

  int? getIntFieldBy(String key) => getField(key).asNullableInt();

  double? getDoubleFieldBy(String key) => getField(key).asNullableDouble();

  DateTime? getDatetimeBy(
    String key, {
    String format = 'yyyy-MM-dd HH:mm:sss',
    String locale = 'en_US',
  }) =>
      getField(key).asDate(
        format: format,
        locale: locale,
      );

  R? getInstanceBy<R extends object.Object<R>>(
    String key, {
    R? recyclerInstance,
  }) =>
      getField(key).asNullableInstance(
        recyclerInstance: recyclerInstance,
      );

  List<R> getListOfInstancesBy<R extends object.Object<R>>(
    String key, [
    String? id,
  ]) =>
      getField(key).asInstanceList(id);

  List<String> getListOfStringBy(
    String key,
  ) =>
      getField(key).asStringList();

  List<num> getListOfNumBy(
    String key,
  ) =>
      getField(key).asNumList();

  List<double> getListOfDoubleBy(
    String key,
  ) =>
      getField(key).asDoubleList();

  List<int> getListOfIntBy(
    String key,
  ) =>
      getField(key).asIntList();

  List<bool> getListOfBoolBy(
    String key,
  ) =>
      getField(key).asBoolList();

  Map<String, R> getMapOfInstancesBy<R extends object.Object<R>>(
    String key, [
    String? id,
  ]) =>
      getField(key).asInstanceMap(id);

  Map<String, String> getMapOfStringBy(String key) =>
      getField(key).asStringMap();

  Map<String, num> getMapOfNumBy(String key) => getField(key).asNumMap();

  Map<String, int> getMapOfIntBy(String key) => getField(key).asIntMap();

  Map<String, double> getMapOfDoubleBy(String key) =>
      getField(key).asDoubleMap();

  Map<String, bool> getMapOfBoolBy(String key) => getField(key).asBoolMap();

  Map<String, dynamic> getMapOfDynamicBy(String key) =>
      getField(key).asDynamicMap();

  /// Required getters
  String getRequiredStringFieldBy(
    String key, {
    String defaultValue = '',
  }) =>
      getField(key).asString(
        defaultValue: defaultValue,
      );

  bool getRequiredBoolFieldBy(
    String key, {
    bool defaultValue = false,
  }) =>
      getField(key).asBool(
        defaultValue: defaultValue,
      );

  num getRequiredNumFieldBy(
    String key, {
    num defaultValue = 0,
  }) =>
      getField(key).asNum(
        defaultValue: defaultValue,
      );

  int getRequiredIntFieldBy(
    String key, {
    int defaultValue = 0,
  }) =>
      getField(key).asInt(
        defaultValue: defaultValue,
      );

  double getRequiredDoubleFieldBy(
    String key, {
    double defaultValue = 0.0,
  }) =>
      getField(key).asDouble(
        defaultValue: defaultValue,
      );

  List<String> getRequiredStringListBy(String key) =>
      getField(key).asStringList();

  List<double> getRequiredDoubleListBy(String key) =>
      getField(key).asDoubleList();

  dynamic getRequiredDynamicBy(String key) => getField(key) as dynamic;

  Map<String, dynamic> getRequiredDynamicMapBy(String key) =>
      getField(key).asDynamicMap();

  R getRequiredInstanceBy<R extends object.Object<R>>(
    String key,
    R defaultValue, {
    R? recyclerInstance,
  }) =>
      getField(key).asInstance(
        defaultValue,
        recyclerInstance: recyclerInstance,
      );
}
