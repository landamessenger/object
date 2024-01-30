import 'dart:convert';

import 'package:object/object.dart';

abstract class Object<T> {
  String getId();

  Map<String, dynamic> toJson();

  String stringValue() {
    var map = toJson();
    return jsonEncode(map);
  }

  T fromJson(Map<String, dynamic> json);

  T fromString(String value) {
    Map<String, dynamic> map = jsonDecode(value);
    return fromJson(map);
  }

  T instance();

  /// Nullable getters
  String? getStringField(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getStringFieldBy(key);

  bool? getBooleanField(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getBooleanFieldBy(key);

  num? getNumField(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getNumFieldBy(key);

  int? getIntField(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getIntFieldBy(key);

  double? getDoubleField(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getDoubleFieldBy(key);

  DateTime? getDatetime(
    Map<String, dynamic>? data,
    String key, {
    String format = 'yyyy-MM-dd HH:mm:sss',
    String locale = 'en_US',
  }) =>
      data.getDatetimeBy(
        key,
        format: format,
        locale: locale,
      );

  R? getInstanceOf<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key, {
    R? recyclerInstance,
  }) =>
      data.getInstanceBy(
        key,
        recyclerInstance: recyclerInstance,
      );

  List<R> getListOfInstances<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfInstancesBy(key);

  List<String> getListOfString(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfStringBy(key);

  List<num> getListOfNum(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfNumBy(key);

  List<double> getListOfDouble(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfDoubleBy(key);

  List<int> getListOfInt(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfIntBy(key);

  List<bool> getListOfBool(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfBoolBy(key);

  Map<String, R> getMapOfInstances<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfInstancesBy(key);

  Map<String, String> getMapOfString(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfStringBy(key);

  Map<String, num> getMapOfNum(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfNumBy(key);

  Map<String, int> getMapOfInt(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfIntBy(key);

  Map<String, double> getMapOfDouble(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfDoubleBy(key);

  Map<String, bool> getMapOfBool(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfBoolBy(key);

  Map<String, dynamic> getMapOfDynamic(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfDynamicBy(key);

  /// Required getters
  String getRequiredStringField(
    Map<String, dynamic>? data,
    String key, {
    String? defaultValue,
  }) =>
      data.getRequiredStringFieldBy(key);

  bool getRequiredBoolField(
    Map<String, dynamic>? data,
    String key, {
    bool defaultValue = false,
  }) =>
      data.getRequiredBoolFieldBy(key);

  num getRequiredNumField(
    Map<String, dynamic>? data,
    String key, {
    num? defaultValue,
  }) =>
      data.getRequiredNumFieldBy(key);

  int getRequiredIntField(
    Map<String, dynamic>? data,
    String key, {
    int? defaultValue,
  }) =>
      data.getRequiredIntFieldBy(key);

  double getRequiredDoubleField(
    Map<String, dynamic>? data,
    String key, {
    double? defaultValue,
  }) =>
      data.getRequiredDoubleFieldBy(key);

  List<String> getRequiredStringList(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getRequiredStringListBy(key);

  List<double> getRequiredDoubleList(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getRequiredDoubleListBy(key);

  dynamic getRequiredDynamic(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getRequiredDynamicBy(key);

  Map<String, dynamic> getRequiredDynamicMap(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getRequiredDynamicMapBy(key);

  R getRequiredInstanceOf<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key,
    R defaultValue, {
    R? recyclerInstance,
  }) =>
      data.getRequiredInstanceBy(
        key,
        defaultValue,
        recyclerInstance: recyclerInstance,
      );

  String toReadableJson() {
    return jsonEncode(this.toJson());
  }
}
