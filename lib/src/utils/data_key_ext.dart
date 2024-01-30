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
    return getField(key).getStringField();
  }

  bool? getBooleanFieldBy(String key) => getField(key).getBooleanField();

  num? getNumFieldBy(String key) => getField(key).getNumField();

  int? getIntFieldBy(String key) => getField(key).getIntField();

  double? getDoubleFieldBy(String key) => getField(key).getDoubleField();

  DateTime? getDatetimeBy(
    String key, {
    String format = 'yyyy-MM-dd HH:mm:sss',
    String locale = 'en_US',
  }) =>
      getField(key).getDatetime(
        format: format,
        locale: locale,
      );

  R? getInstanceBy<R extends object.Object<R>>(
    String key, {
    R? recyclerInstance,
  }) =>
      getField(key).getInstanceOf(
        recyclerInstance: recyclerInstance,
      );

  List<R> getListOfInstancesBy<R extends object.Object<R>>(
    String key, [
    String? id,
  ]) =>
      getField(key).getListOfInstances(id);

  List<String> getListOfStringBy(
    String key,
  ) =>
      getField(key).getListOfString();

  List<num> getListOfNumBy(
    String key,
  ) =>
      getField(key).getListOfNum();

  List<double> getListOfDoubleBy(
    String key,
  ) =>
      getField(key).getListOfDouble();

  List<int> getListOfIntBy(
    String key,
  ) =>
      getField(key).getListOfInt();

  List<bool> getListOfBoolBy(
    String key,
  ) =>
      getField(key).getListOfBool();

  Map<String, R> getMapOfInstancesBy<R extends object.Object<R>>(
    String key, [
    String? id,
  ]) =>
      getField(key).getMapOfInstances(id);

  Map<String, String> getMapOfStringBy(String key) =>
      getField(key).getMapOfString();

  Map<String, num> getMapOfNumBy(String key) => getField(key).getMapOfNum();

  Map<String, int> getMapOfIntBy(String key) => getField(key).getMapOfInt();

  Map<String, double> getMapOfDoubleBy(String key) =>
      getField(key).getMapOfDouble();

  Map<String, bool> getMapOfBoolBy(String key) => getField(key).getMapOfBool();

  Map<String, dynamic> getMapOfDynamicBy(String key) =>
      getField(key).getMapOfDynamic();

  /// Required getters
  String getRequiredStringFieldBy(
    String key, {
    String defaultValue = '',
  }) =>
      getField(key).getRequiredStringField(
        defaultValue: defaultValue,
      );

  bool getRequiredBoolFieldBy(
    String key, {
    bool defaultValue = false,
  }) =>
      getField(key).getRequiredBoolField(
        defaultValue: defaultValue,
      );

  num getRequiredNumFieldBy(
    String key, {
    num defaultValue = 0,
  }) =>
      getField(key).getRequiredNumField(
        defaultValue: defaultValue,
      );

  int getRequiredIntFieldBy(
    String key, {
    int defaultValue = 0,
  }) =>
      getField(key).getRequiredIntField(
        defaultValue: defaultValue,
      );

  double getRequiredDoubleFieldBy(
    String key, {
    double defaultValue = 0.0,
  }) =>
      getField(key).getRequiredDoubleField(
        defaultValue: defaultValue,
      );

  List<String> getRequiredStringListBy(String key) =>
      getField(key).getRequiredStringList();

  List<double> getRequiredDoubleListBy(String key) =>
      getField(key).getRequiredDoubleList();

  dynamic getRequiredDynamicBy(String key) => getField(key) as dynamic;

  Map<String, dynamic> getRequiredDynamicMapBy(String key) =>
      getField(key).getRequiredDynamicMap();

  R getRequiredInstanceBy<R extends object.Object<R>>(
    String key,
    R defaultValue, {
    R? recyclerInstance,
  }) =>
      getField(key).getRequiredInstanceOf(
        defaultValue,
        recyclerInstance: recyclerInstance,
      );
}
