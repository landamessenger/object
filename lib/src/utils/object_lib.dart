import 'package:object/src/manager/manager.dart';
import 'package:object/src/model/base/object.dart';

class ObjectLib {
  static ObjectLib? _instance;

  ObjectLib._internal();

  factory ObjectLib() {
    _instance ??= ObjectLib._internal();
    return _instance!;
  }

  ObjectManager get objectManager => ObjectManager();

  void addClasses(List<dynamic> instances) =>
      objectManager.instances.addAll(instances);

  Map<String, T> fromBasicMap<T>(Map<dynamic, dynamic> map) =>
      objectManager.fromBasicMap(
        map,
      );

  Map<String, T> fromComplexMap<T extends Object<T>>(
    Map<dynamic, dynamic> map,
    String id,
  ) =>
      objectManager.fromComplexMap(
        map,
        id,
      );

  List<T> listObjectFromBasicType<T>(List<dynamic> list) =>
      objectManager.listObjectFromBasicType<T>(
        list,
      );

  List<T> listObjectFromComplexType<T extends Object<T>>(
    List<dynamic> list,
    String id,
  ) =>
      objectManager.listObjectFromComplexType<T>(
        list,
        id,
      );

  Map<String, dynamic> internalLinkerToMap(map) =>
      objectManager.internalLinkerToMap(map);

  T instance<T extends Object<T>>(Type t, dynamic id) =>
      objectManager.instance<T>(
        t,
        id,
      );
}
