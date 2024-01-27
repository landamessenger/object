import 'dart:convert';

import 'package:object/src/manager/manager.dart';
import 'package:object/src/utils/date_ext.dart';
import 'package:object/src/utils/print.dart';

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

  /// Base getter method
  dynamic getField(Map<String, dynamic>? data, String key) {
    try {
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
  String? getStringField(Map<String, dynamic>? data, String key) {
    try {
      dynamic value = getField(data, key);
      if (value is String) {
        return value;
      }
      return null;
    } catch (e) {
      printDebug('Error on getStringField $runtimeType');
      printDebug(e);
      return null;
    }
  }

  bool? getBooleanField(Map<String, dynamic>? data, String key) {
    try {
      dynamic value = getField(data, key);
      if (value is bool) {
        return value;
      }
      return null;
    } catch (e) {
      printDebug('Error on getBooleanField $runtimeType');
      printDebug(e);
      return null;
    }
  }

  num? getNumField(Map<String, dynamic>? data, String key) {
    try {
      dynamic value = getField(data, key);
      if (value is num) {
        return value;
      }
      return null;
    } catch (e) {
      printDebug('Error on getNumField $runtimeType');
      printDebug(e);
      return null;
    }
  }

  int? getIntField(Map<String, dynamic>? data, String key) {
    try {
      dynamic value = getField(data, key);
      if (value is String) {
        return int.parse(value);
      } else if (value is double) {
        return value.toInt();
      } else if (value is int) {
        return value;
      }
      return null;
    } catch (e) {
      printDebug('Error on getIntField $runtimeType');
      printDebug(e);
      return null;
    }
  }

  double? getDoubleField(Map<String, dynamic>? data, String key) {
    try {
      dynamic value = getField(data, key);
      if (value is String) {
        return double.parse(value);
      } else if (value is int) {
        return value.toDouble();
      } else if (value is double) {
        return value;
      }
      return null;
    } catch (e) {
      printDebug('Error on getDoubleField $runtimeType');
      printDebug(e);
      return null;
    }
  }

  DateTime? getDatetime(
    Map<String, dynamic>? data,
    String key, {
    String format = 'yyyy-MM-dd HH:mm:sss',
    String locale = 'en_US',
  }) {
    try {
      return key.dateFrom(
        data,
        format: format,
        locale: locale,
      );
    } catch (e) {
      printDebug('Error on getDatetime $runtimeType');
      printDebug(e);
      return null;
    }
  }

  R? getInstanceOf<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key,
  ) {
    try {
      if (data == null) return null;
      if (!data.containsKey(key)) return null;

      final instance = ObjectManager().instance<R>(R, null);
      return instance.fromJson(
        ObjectManager().internalLinkerToMap(
          data[key],
        ),
      );
    } catch (e) {
      printDebug('Error on getInstanceOf $runtimeType');
      printDebug(e);
      return null;
    }
  }

  List<R> getListOfInstances<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key,
  ) {
    try {
      if (data == null) return [];
      if (!data.containsKey(key)) return [];

      return ObjectManager().listObjectFromComplexType<R>(
        data[key] ?? [],
        getId(),
      );
    } catch (e) {
      printDebug('Error on getListOfInstances $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<String> getListOfString(
    Map<String, dynamic>? data,
    String key,
  ) {
    try {
      if (data == null) return [];
      if (!data.containsKey(key)) return [];

      return ObjectManager().listObjectFromBasicType<String>(
        data[key] ?? [],
      );
    } catch (e) {
      printDebug('Error on getListOfString $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<num> getListOfNum(
    Map<String, dynamic>? data,
    String key,
  ) {
    try {
      if (data == null) return [];
      if (!data.containsKey(key)) return [];

      return ObjectManager().listObjectFromBasicType<num>(
        data[key] ?? [],
      );
    } catch (e) {
      printDebug('Error on getListOfNum $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<double> getListOfDouble(
    Map<String, dynamic>? data,
    String key,
  ) {
    try {
      if (data == null) return [];
      if (!data.containsKey(key)) return [];

      return ObjectManager().listObjectFromBasicType<double>(
        data[key] ?? [],
      );
    } catch (e) {
      printDebug('Error on getListOfDouble $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<int> getListOfInt(
    Map<String, dynamic>? data,
    String key,
  ) {
    try {
      if (data == null) return [];
      if (!data.containsKey(key)) return [];

      return ObjectManager().listObjectFromBasicType<int>(
        data[key] ?? [],
      );
    } catch (e) {
      printDebug('Error on getListOfInt $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<bool> getListOfBool(
    Map<String, dynamic>? data,
    String key,
  ) {
    try {
      if (data == null) return [];
      if (!data.containsKey(key)) return [];

      return ObjectManager().listObjectFromBasicType<bool>(
        data[key] ?? [],
      );
    } catch (e) {
      printDebug('Error on getListOfBool $runtimeType');
      printDebug(e);
      return [];
    }
  }

  Map<String, R> getMapOfInstances<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key,
  ) {
    try {
      if (data == null) return {};
      if (!data.containsKey(key)) return {};

      return ObjectManager().fromComplexMap<R>(
        data[key] ?? {},
        getId(),
      );
    } catch (e) {
      printDebug('Error on getMapOfInstances $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, String> getMapOfString(Map<String, dynamic>? data, String key) {
    try {
      if (data == null) return {};
      if (!data.containsKey(key)) return {};

      return ObjectManager().fromBasicMap<String>(
        data[key] ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfStrings $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, num> getMapOfNum(Map<String, dynamic>? data, String key) {
    try {
      if (data == null) return {};
      if (!data.containsKey(key)) return {};

      return ObjectManager().fromBasicMap<num>(
        data[key] ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfNum $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, int> getMapOfInt(Map<String, dynamic>? data, String key) {
    try {
      if (data == null) return {};
      if (!data.containsKey(key)) return {};

      return ObjectManager().fromBasicMap<int>(
        data[key] ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfInt $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, double> getMapOfDouble(Map<String, dynamic>? data, String key) {
    try {
      if (data == null) return {};
      if (!data.containsKey(key)) return {};

      return ObjectManager().fromBasicMap<double>(
        data[key] ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfDouble $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, bool> getMapOfBool(Map<String, dynamic>? data, String key) {
    try {
      if (data == null) return {};
      if (!data.containsKey(key)) return {};

      return ObjectManager().fromBasicMap<bool>(
        data[key] ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfBool $runtimeType');
      printDebug(e);
      return {};
    }
  }

  /// Required getters
  String getRequiredStringField(
    Map<String, dynamic>? data,
    String key, {
    String? defaultValue,
  }) {
    try {
      String? value = getStringField(data, key);
      return value ?? defaultValue ?? '';
    } catch (e) {
      printDebug('Error on getRequiredStringField $runtimeType');
      printDebug(e);
      return defaultValue ?? '';
    }
  }

  bool getRequiredBoolField(Map<String, dynamic>? data, String key,
      {bool defaultValue = false}) {
    try {
      bool? value = getBooleanField(data, key);
      return value ?? defaultValue;
    } catch (e) {
      printDebug('Error on getRequiredBooleanField $runtimeType');
      printDebug(e);
      return false;
    }
  }

  num getRequiredNumField(
    Map<String, dynamic>? data,
    String key, {
    num? defaultValue,
  }) {
    try {
      num? value = getNumField(data, key);
      return value ?? defaultValue ?? 0;
    } catch (e) {
      printDebug('Error on getRequiredNumField $runtimeType');
      printDebug(e);
      return defaultValue ?? 0;
    }
  }

  int getRequiredIntField(
    Map<String, dynamic>? data,
    String key, {
    int? defaultValue,
  }) {
    try {
      int? value = getIntField(data, key);
      return value ?? defaultValue ?? 0;
    } catch (e) {
      printDebug('Error on getRequiredIntField $runtimeType');
      printDebug(e);
      return defaultValue ?? 0;
    }
  }

  double getRequiredDoubleField(
    Map<String, dynamic>? data,
    String key, {
    double? defaultValue,
  }) {
    try {
      double? value = getDoubleField(data, key);
      return value ?? defaultValue ?? 0.0;
    } catch (e) {
      printDebug('Error on getRequiredDoubleField $runtimeType');
      printDebug(e);
      return defaultValue ?? 0.0;
    }
  }

  List<String> getRequiredStringList(Map<String, dynamic>? data, String key) {
    if (data == null) return [];
    try {
      return ObjectManager().listObjectFromBasicType<String>(
        data[key] ?? [],
      );
    } catch (e) {
      printDebug('Error on getRequiredStringList $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<double> getRequiredDoubleList(Map<String, dynamic>? data, String key) {
    if (data == null) return [];
    try {
      return ObjectManager().listObjectFromBasicType<double>(
        data[key] ?? [],
      );
    } catch (e) {
      printDebug('Error on getRequiredDoubleList $runtimeType');
      printDebug(e);
      return [];
    }
  }

  dynamic getRequiredDynamic(Map<String, dynamic>? data, String key) {
    if (data == null) return {};
    try {
      return getField(data, key) ?? {};
    } catch (e) {
      printDebug('Error on getRequiredDynamic $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, dynamic> getRequiredDynamicMap(
      Map<String, dynamic>? data, String key) {
    if (data == null) return {};
    try {
      return ObjectManager().internalLinkerToMap(data[key] ?? {});
    } catch (e) {
      printDebug('Error on getRequiredDynamicMap $runtimeType');
      printDebug(e);
      return {};
    }
  }

  R getRequiredInstanceOf<R extends Object<R>>(
    Map<String, dynamic>? data,
    String key,
    R? instance,
    R Function() defaultValue,
  ) {
    try {
      if (instance == null) return defaultValue();
      if (data == null) return defaultValue();
      if (!data.containsKey(key)) return defaultValue();

      return instance.fromJson(
        ObjectManager().internalLinkerToMap(
          data[key],
        ),
      );
    } catch (e) {
      printDebug('Error on getInstanceOf $runtimeType');
      printDebug(e);
      return defaultValue();
    }
  }
}
