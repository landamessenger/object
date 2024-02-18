import 'package:object/src/model/base/object.dart';

class ObjectManager {
  static ObjectManager? _instance;

  ObjectManager._internal();

  factory ObjectManager() {
    _instance ??= ObjectManager._internal();
    return _instance!;
  }

  final Map<String, dynamic> _referencesMap = <String, dynamic>{};

  final Map<String, dynamic> _instanceMap = <String, dynamic>{};

  final List<dynamic> instances = <dynamic>[];

  Map<String, T> fromBasicMap<T>(Map<dynamic, dynamic> map) {
    var re = <String, T>{};
    if (map.isEmpty) return re;
    for (MapEntry<dynamic, dynamic> entry in map.entries) {
      re[entry.key] = entry.value as T;
    }
    return re;
  }

  Map<String, dynamic> normalizeMap(Map<dynamic, dynamic> map) {
    var entries = map.entries.toList();
    var m = <String, dynamic>{};
    for (var entry in entries) {
      var key = entry.key as String;
      m[key] = entry.value as dynamic;
    }
    return m;
  }

  Map<String, T> fromComplexMap<T extends Object<T>>(
    Map<dynamic, dynamic> map,
    String id,
  ) {
    var re = <String, T>{};
    if (map.isEmpty) return re;
    for (var i = 0; i < map.entries.length; i++) {
      var entry = map.entries.toList()[i];
      var data = ObjectManager().normalizeMap(entry.value);
      T instance =
          ObjectManager().instance<T>(T, '${id}_${i}_${entry.key}_${data['id']}');
      var k = entry.key as String;
      instance.fromJson(data);
      re[k] = instance;
    }
    return re;
  }

  List<T> listObjectFromBasicType<T>(List<dynamic> list) {
    var re = <T>[];
    if (list.isEmpty) return re;
    for (dynamic val in list) {
      re.add(val as T);
    }
    return re;
  }

  List<T> listObjectFromComplexType<T extends Object<T>>(
    List<dynamic> list,
    String id,
  ) {
    var re = <T>[];
    if (list.isEmpty) return re;
    for (var i = 0; i < list.length; i++) {
      dynamic val = list[i];
      var data = internalLinkerToMap(val);
      T instance = ObjectManager().instance<T>(T, '${id}_${i}_${data['id']}');
      instance.fromJson(data);
      re.add(instance);
    }
    return re;
  }

  Map<String, dynamic> internalLinkerToMap(map) {
    var re = <String, dynamic>{};
    if (map == null || map.length == 0) return re;
    try {
      for (MapEntry<dynamic, dynamic> entry in map.entries) {
        re[entry.key] = entry.value;
      }
    } catch (e) {
      for (MapEntry<String, dynamic> entry in map.entries) {
        re[entry.key] = entry.value;
      }
    }
    return re;
  }

  T _createInstance<T extends Object<T>>(Type t) {
    if (_instanceMap.length != instances.length) {
      _instanceMap.clear();
      for (dynamic i in instances) {
        _instanceMap[i.runtimeType.toString()] = i;
      }
    }
    String val = t.toString();
    if (_instanceMap[val] == null) {
      throw ('Missing class serialization: $val');
    }
    return _instanceMap[val].instance();
  }

  T instance<T extends Object<T>>(Type t, dynamic id) {
    // printDebug('instance ${t.toString()} - $id');
    if (id == null) {
      return _createInstance(t);
    }
    String i = id.toString();
    if (i.isEmpty) {
      return _createInstance(t);
    }
    if (_instanceMap.length != instances.length) {
      _instanceMap.clear();
      for (dynamic i in instances) {
        _instanceMap[i.runtimeType.toString()] = i;
      }
    }
    String val = t.toString();
    if (_instanceMap[val] == null) {
      throw ('Missing class serialization: $val');
    }
    String identifier = '${val}_$i';
    if (_referencesMap[identifier] == null) {
      _referencesMap[identifier] = _instanceMap[val].instance();
    }
    return _referencesMap[identifier];
  }
}
