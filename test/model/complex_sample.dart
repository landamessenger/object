import 'package:object/object.dart';

import 'simple_sample.dart';

class ComplexSample extends Object<ComplexSample> {
  SimpleSample? sample;

  List<SimpleSample> list = [];

  Map<String, SimpleSample> map = {};

  ComplexSample();

  @override
  Map<String, dynamic> toJson() => {
        'sample': sample?.toJson(),
        'list': list.toJson(),
        'map': map.toJson(),
      };

  @override
  ComplexSample fromJson(Map<String, dynamic> json) {
    sample = getInstanceOf(json, 'sample');
    list = getListOfInstances(json, 'list');
    map = getMapOfInstances(json, 'map');
    return this;
  }

  @override
  String getId() => 'id';

  @override
  ComplexSample instance() => ComplexSample();
}
