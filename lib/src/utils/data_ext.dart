import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:object/src/manager/manager.dart';
import 'package:object/src/model/base/object.dart' as object;
import 'package:object/src/utils/print.dart';
import 'package:object/src/utils/time_millis.dart';

extension DataExt<T extends Object> on T? {
  /// Nullable getters
  String? asNullableString() {
    try {
      final data = this as dynamic;
      if (data is String) {
        return data;
      }
      return null;
    } catch (e) {
      printDebug('Error on getStringField $runtimeType');
      printDebug(e);
      return null;
    }
  }

  bool? asNullableBool() {
    try {
      final data = this as dynamic;
      if (data is bool) {
        return data;
      }
      return null;
    } catch (e) {
      printDebug('Error on getBooleanField $runtimeType');
      printDebug(e);
      return null;
    }
  }

  num? asNullableNum() {
    try {
      final data = this as dynamic;
      if (data is num) {
        return data;
      }
      return null;
    } catch (e) {
      printDebug('Error on getNumField $runtimeType');
      printDebug(e);
      return null;
    }
  }

  int? asNullableInt() {
    try {
      final data = this as dynamic;
      if (data is String) {
        return int.parse(data);
      } else if (data is double) {
        return data.toInt();
      } else if (data is int) {
        return data;
      }
      return null;
    } catch (e) {
      printDebug('Error on getIntField $runtimeType');
      printDebug(e);
      return null;
    }
  }

  double? asNullableDouble() {
    try {
      final data = this as dynamic;
      if (data is String) {
        return double.parse(data);
      } else if (data is int) {
        return data.toDouble();
      } else if (data is double) {
        return data;
      }
      return null;
    } catch (e) {
      printDebug('Error on getDoubleField $runtimeType');
      printDebug(e);
      return null;
    }
  }

  DateTime? asDate({
    String format = 'yyyy-MM-dd HH:mm:sss',
    String locale = 'en_US',
  }) {
    try {
      DateTime? date;
      if (this == 'null') {
        date = null;
      } else if (this is String) {
        if (isMillis(this as String, format)) {
          date = Timestamp.fromMillisecondsSinceEpoch(
            int.parse(
              this as String,
            ),
          ).toDate();
        } else {
          var df = DateFormat(
            format,
            locale,
          );
          date = df.parse(this as String);
        }
      } else if (this != null && this is Timestamp) {
        date = (this as Timestamp).toDate();
      } else if (this != null && this is DateTime) {
        date = this as DateTime;
      } else if (this != null && (this as dynamic)['_seconds'] != null) {
        date = Timestamp((this as dynamic)['_seconds'],
                (this as dynamic)['_nanoseconds'])
            .toDate();
      }
      return date;
    } catch (e) {
      printDebug('Error building date from $this: $e');
      return null;
    }
  }

  R? asNullableInstance<R extends object.Object<R>>({
    R? recyclerInstance,
  }) {
    try {
      final data = this as dynamic;
      if (data == null) return null;

      final instance = recyclerInstance ?? ObjectManager().instance<R>(R, null);
      return instance.fromJson(
        ObjectManager().internalLinkerToMap(
          data,
        ),
      );
    } catch (e) {
      printDebug('Error on getInstanceOf $runtimeType');
      printDebug(e);
      return null;
    }
  }

  List<R> asInstanceList<R extends object.Object<R>>([String? id]) {
    try {
      final data = this as dynamic;
      if (data == null) return [];
      return ObjectManager().listObjectFromComplexType<R>(
        data ?? [],
        id ?? '',
      );
    } catch (e) {
      printDebug('Error on getListOfInstances $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<String> asStringList() {
    try {
      final data = this as dynamic;
      if (data == null) return [];
      return ObjectManager().listObjectFromBasicType<String>(
        data ?? [],
      );
    } catch (e) {
      printDebug('Error on getListOfString $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<num> asNumList() {
    try {
      final data = this as dynamic;
      if (data == null) return [];
      return ObjectManager().listObjectFromBasicType<num>(
        data ?? [],
      );
    } catch (e) {
      printDebug('Error on getListOfNum $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<double> asDoubleList() {
    try {
      final data = this as dynamic;
      if (data == null) return [];
      return ObjectManager().listObjectFromBasicType<double>(
        data ?? [],
      );
    } catch (e) {
      printDebug('Error on getListOfDouble $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<int> asIntList() {
    try {
      final data = this as dynamic;
      if (data == null) return [];
      return ObjectManager().listObjectFromBasicType<int>(
        data ?? [],
      );
    } catch (e) {
      printDebug('Error on getListOfInt $runtimeType');
      printDebug(e);
      return [];
    }
  }

  List<bool> asBoolList() {
    try {
      final data = this as dynamic;
      if (data == null) return [];
      return ObjectManager().listObjectFromBasicType<bool>(
        data ?? [],
      );
    } catch (e) {
      printDebug('Error on getListOfBool $runtimeType');
      printDebug(e);
      return [];
    }
  }

  Map<String, R> asInstanceMap<R extends object.Object<R>>([
    String? id,
  ]) {
    try {
      final data = this as dynamic;
      if (data == null) return {};
      return ObjectManager().fromComplexMap<R>(
        data ?? {},
        id ?? '',
      );
    } catch (e) {
      printDebug('Error on getMapOfInstances $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, String> asStringMap() {
    try {
      final data = this as dynamic;
      if (data == null) return {};
      return ObjectManager().fromBasicMap<String>(
        data ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfStrings $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, num> asNumMap() {
    try {
      final data = this as dynamic;
      if (data == null) return {};
      return ObjectManager().fromBasicMap<num>(
        data ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfNum $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, int> asIntMap() {
    try {
      final data = this as dynamic;
      if (data == null) return {};
      return ObjectManager().fromBasicMap<int>(
        data ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfInt $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, double> asDoubleMap() {
    try {
      final data = this as dynamic;
      if (data == null) return {};
      return ObjectManager().fromBasicMap<double>(
        data ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfDouble $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, bool> asBoolMap() {
    try {
      final data = this as dynamic;
      if (data == null) return {};
      return ObjectManager().fromBasicMap<bool>(
        data ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfBool $runtimeType');
      printDebug(e);
      return {};
    }
  }

  Map<String, dynamic> asDynamicMap() {
    try {
      final data = this as dynamic;
      if (data == null) return {};
      return ObjectManager().fromBasicMap<dynamic>(
        data ?? {},
      );
    } catch (e) {
      printDebug('Error on getMapOfDynamic $runtimeType');
      printDebug(e);
      return {};
    }
  }

  /// Required getters
  String asString({
    String defaultValue = '',
  }) =>
      asNullableString() ?? defaultValue;

  bool asBool({bool defaultValue = false}) =>
      asNullableBool() ?? defaultValue;

  num asNum({
    num defaultValue = 0,
  }) =>
      asNullableNum() ?? defaultValue;

  int asInt({
    int defaultValue = 0,
  }) =>
      asNullableInt() ?? defaultValue;

  double asDouble({
    double defaultValue = 0.0,
  }) =>
      asNullableDouble() ?? defaultValue;

  R asInstance<R extends object.Object<R>>(
    R defaultValue, {
    R? recyclerInstance,
  }) =>
      asNullableInstance(
        recyclerInstance: recyclerInstance,
      ) ??
      defaultValue;
}
