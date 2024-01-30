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
      data.getStringField(key);

  bool? getBooleanField(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getBooleanField(key);

  num? getNumField(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getNumField(key);

  int? getIntField(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getIntField(key);

  double? getDoubleField(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getDoubleField(key);

  DateTime? getDatetime(
    Map<String, dynamic>? data,
    String key, {
    String format = 'yyyy-MM-dd HH:mm:sss',
    String locale = 'en_US',
  }) =>
      data.getDatetime(
        key,
        format: format,
        locale: locale,
      );

  R? getInstanceOf<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key, {
    R? recyclerInstance,
  }) =>
      data.getInstanceOf(
        key,
        recyclerInstance: recyclerInstance,
      );

  List<R> getListOfInstances<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfInstances(key);

  List<String> getListOfString(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfString(key);

  List<num> getListOfNum(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfNum(key);

  List<double> getListOfDouble(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfDouble(key);

  List<int> getListOfInt(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfInt(key);

  List<bool> getListOfBool(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getListOfBool(key);

  Map<String, R> getMapOfInstances<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfInstances(key);

  Map<String, String> getMapOfString(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfString(key);

  Map<String, num> getMapOfNum(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfNum(key);

  Map<String, int> getMapOfInt(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfInt(key);

  Map<String, double> getMapOfDouble(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfDouble(key);

  Map<String, bool> getMapOfBool(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfBool(key);

  Map<String, dynamic> getMapOfDynamic(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getMapOfDynamic(key);

  /// Required getters
  String getRequiredStringField(
    Map<String, dynamic>? data,
    String key, {
    String? defaultValue,
  }) =>
      data.getRequiredStringField(key);

  bool getRequiredBoolField(
    Map<String, dynamic>? data,
    String key, {
    bool defaultValue = false,
  }) =>
      data.getRequiredBoolField(key);

  num getRequiredNumField(
    Map<String, dynamic>? data,
    String key, {
    num? defaultValue,
  }) =>
      data.getRequiredNumField(key);

  int getRequiredIntField(
    Map<String, dynamic>? data,
    String key, {
    int? defaultValue,
  }) =>
      data.getRequiredIntField(key);

  double getRequiredDoubleField(
    Map<String, dynamic>? data,
    String key, {
    double? defaultValue,
  }) =>
      data.getRequiredDoubleField(key);

  List<String> getRequiredStringList(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getRequiredStringList(key);

  List<double> getRequiredDoubleList(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getRequiredDoubleList(key);

  dynamic getRequiredDynamic(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getRequiredDynamic(key);

  Map<String, dynamic> getRequiredDynamicMap(
    Map<String, dynamic>? data,
    String key,
  ) =>
      data.getRequiredDynamicMap(key);

  R getRequiredInstanceOf<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key,
    R defaultValue, {
    R? recyclerInstance,
  }) =>
      data.getRequiredInstanceOf(
        key,
        defaultValue,
        recyclerInstance: recyclerInstance,
      );

  String toReadableJson() {
    return jsonEncode(this.toJson());
  }
}
