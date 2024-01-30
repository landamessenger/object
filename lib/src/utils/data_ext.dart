import 'package:object/src/manager/manager.dart';
import 'package:object/src/model/base/object.dart';
import 'package:object/src/utils/date_ext.dart';
import 'package:object/src/utils/print.dart';

extension DataExt on Map<String, dynamic>? {
  dynamic getField(String key) {
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
  String? getStringField(String key) {
    try {
      final data = this;
      dynamic value = data.getField(key);
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

  bool? getBooleanField(String key) {
    try {
      final data = this;
      dynamic value = data.getField(key);
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

  num? getNumField(String key) {
    try {
      final data = this;
      dynamic value = data.getField(key);
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

  int? getIntField(String key) {
    try {
      final data = this;
      dynamic value = data.getField(key);
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

  double? getDoubleField(String key) {
    try {
      final data = this;
      dynamic value = data.getField(key);
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
    String key, {
    String format = 'yyyy-MM-dd HH:mm:sss',
    String locale = 'en_US',
  }) {
    try {
      final data = this;
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
    String key, {
    R? recyclerInstance,
  }) {
    try {
      final data = this;
      if (data == null) return null;
      if (!data.containsKey(key)) return null;

      final instance = recyclerInstance ?? ObjectManager().instance<R>(R, null);
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

  List<R> getListOfInstances<R extends Object<R>>(String key, [String? id]) {
    try {
      final data = this;
      if (data == null) return [];
      if (!data.containsKey(key)) return [];

      return ObjectManager().listObjectFromComplexType<R>(
        data[key] ?? [],
        id ?? '',
      );
    } catch (e) {
      printDebug('Error on getListOfInstances $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<String> getListOfString(
    String key,
  ) {
    try {
      final data = this;
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
    String key,
  ) {
    try {
      final data = this;
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
    String key,
  ) {
    try {
      final data = this;
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
    String key,
  ) {
    try {
      final data = this;
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
    String key,
  ) {
    try {
      final data = this;
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
    String key, [
    String? id,
  ]) {
    try {
      final data = this;
      if (data == null) return {};
      if (!data.containsKey(key)) return {};

      return ObjectManager().fromComplexMap<R>(
        data[key] ?? {},
        id ?? '',
      );
    } catch (e) {
      printDebug('Error on getMapOfInstances $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, String> getMapOfString(String key) {
    try {
      final data = this;
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

  Map<String, num> getMapOfNum(String key) {
    try {
      final data = this;
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

  Map<String, int> getMapOfInt(String key) {
    try {
      final data = this;
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

  Map<String, double> getMapOfDouble(String key) {
    try {
      final data = this;
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

  Map<String, bool> getMapOfBool(String key) {
    try {
      final data = this;
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

  Map<String, dynamic> getMapOfDynamic(String key) {
    try {
      final data = this;
      if (data == null) return {};
      if (!data.containsKey(key)) return {};

      return ObjectManager().fromBasicMap<dynamic>(
        data[key] ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfDynamic $runtimeType');
      printDebug(e);
      return {};
    }
  }

  /// Required getters
  String getRequiredStringField(
    String key, {
    String? defaultValue,
  }) {
    try {
      final data = this;
      String? value = data.getStringField(key);
      return value ?? defaultValue ?? '';
    } catch (e) {
      printDebug('Error on getRequiredStringField $runtimeType');
      printDebug(e);
      return defaultValue ?? '';
    }
  }

  bool getRequiredBoolField(String key, {bool defaultValue = false}) {
    try {
      final data = this;
      bool? value = data.getBooleanField(key);
      return value ?? defaultValue;
    } catch (e) {
      printDebug('Error on getRequiredBooleanField $runtimeType');
      printDebug(e);
      return false;
    }
  }

  num getRequiredNumField(
    String key, {
    num? defaultValue,
  }) {
    try {
      final data = this;
      num? value = data.getNumField(key);
      return value ?? defaultValue ?? 0;
    } catch (e) {
      printDebug('Error on getRequiredNumField $runtimeType');
      printDebug(e);
      return defaultValue ?? 0;
    }
  }

  int getRequiredIntField(
    String key, {
    int? defaultValue,
  }) {
    try {
      final data = this;
      int? value = data.getIntField(key);
      return value ?? defaultValue ?? 0;
    } catch (e) {
      printDebug('Error on getRequiredIntField $runtimeType');
      printDebug(e);
      return defaultValue ?? 0;
    }
  }

  double getRequiredDoubleField(
    String key, {
    double? defaultValue,
  }) {
    try {
      final data = this;
      double? value = data.getDoubleField(key);
      return value ?? defaultValue ?? 0.0;
    } catch (e) {
      printDebug('Error on getRequiredDoubleField $runtimeType');
      printDebug(e);
      return defaultValue ?? 0.0;
    }
  }

  List<String> getRequiredStringList(String key) {
    final data = this;
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

  List<double> getRequiredDoubleList(String key) {
    final data = this;
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

  dynamic getRequiredDynamic(String key) {
    final data = this;
    if (data == null) return {};
    try {
      return data.getField(key) ?? {};
    } catch (e) {
      printDebug('Error on getRequiredDynamic $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, dynamic> getRequiredDynamicMap(String key) {
    final data = this;
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
    String key,
    R defaultValue, {
    R? recyclerInstance,
  }) {
    try {
      final data = this;
      if (data == null) return defaultValue;
      if (!data.containsKey(key)) return defaultValue;

      final instance = recyclerInstance ?? ObjectManager().instance<R>(R, null);
      return instance.fromJson(
        ObjectManager().internalLinkerToMap(
          data[key],
        ),
      );
    } catch (e) {
      printDebug('Error on getRequiredInstanceOf $runtimeType');
      printDebug(e);
      return defaultValue;
    }
  }
}
