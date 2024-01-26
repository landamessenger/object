import 'package:object/src/model/base/object.dart';

extension ObjectExt<T extends Object<T>> on Map<String, T> {
  Map<String, dynamic> toJson() {
    var re = <String, dynamic>{};
    if (isEmpty) return re;
    for (MapEntry<String, Object> entry in entries) {
      re[entry.key] = entry.value.toJson();
    }
    return re;
  }
}

extension ObjectListExt<T extends Object<T>> on List<T> {
  List<Map<String, dynamic>> toJson() {
    var re = <Map<String, dynamic>>[];
    if (isEmpty) return re;
    for (dynamic val in this) {
      var d = val as Object;
      re.add(d.toJson());
    }
    return re;
  }
}
