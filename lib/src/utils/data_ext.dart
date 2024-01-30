import 'package:object/src/manager/manager.dart';
import 'package:object/src/model/base/object.dart' as object;
import 'package:object/src/utils/date_ext.dart';
import 'package:object/src/utils/print.dart';

extension DataExt<T extends Object> on T? {
  /// Nullable getters
  String? getStringField() {
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

  bool? getBooleanField() {
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

  num? getNumField() {
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

  int? getIntField() {
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

  double? getDoubleField() {
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

  DateTime? getDatetime({
    String format = 'yyyy-MM-dd HH:mm:sss',
    String locale = 'en_US',
  }) {
    try {
      return dateFrom(
        format: format,
        locale: locale,
      );
    } catch (e) {
      printDebug('Error on getDatetime $runtimeType');
      printDebug(e);
      return null;
    }
  }

  R? getInstanceOf<R extends object.Object<R>>({
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

  List<R> getListOfInstances<R extends object.Object<R>>([String? id]) {
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

  List<String> getListOfString() {
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

  List<num> getListOfNum() {
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

  List<double> getListOfDouble() {
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

  List<int> getListOfInt() {
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

  List<bool> getListOfBool() {
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

  Map<String, R> getMapOfInstances<R extends object.Object<R>>([
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

  Map<String, String> getMapOfString() {
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

  Map<String, num> getMapOfNum() {
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

  Map<String, int> getMapOfInt() {
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

  Map<String, double> getMapOfDouble() {
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

  Map<String, bool> getMapOfBool() {
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

  Map<String, dynamic> getMapOfDynamic() {
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
  String getRequiredStringField({
    String defaultValue = '',
  }) =>
      getStringField() ?? defaultValue;

  bool getRequiredBoolField({bool defaultValue = false}) =>
      getBooleanField() ?? defaultValue;

  num getRequiredNumField({
    num defaultValue = 0,
  }) =>
      getNumField() ?? defaultValue;

  int getRequiredIntField({
    int defaultValue = 0,
  }) =>
      getIntField() ?? defaultValue;

  double getRequiredDoubleField({
    double defaultValue = 0.0,
  }) =>
      getDoubleField() ?? defaultValue;

  List<String> getRequiredStringList() => getListOfString();

  List<double> getRequiredDoubleList() => getListOfDouble();

  Map<String, dynamic> getRequiredDynamicMap() => getMapOfDynamic();

  R getRequiredInstanceOf<R extends object.Object<R>>(
    R defaultValue, {
    R? recyclerInstance,
  }) =>
      getInstanceOf(
        recyclerInstance: recyclerInstance,
      ) ??
      defaultValue;
}
