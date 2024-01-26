import 'package:object/object.dart';

export 'package:object/object.dart';

import 'package:example/model/annotation_simple_sample.dart';
import 'package:example/model/annotation_complex_sample.dart';

abstract class AnnotationSimpleSampleGen
    extends Object<AnnotationSimpleSample> {
  abstract String id;
  abstract num numberContent;
  abstract int integerContent;
  abstract double doubleContent;
  abstract String stringContent;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'numberContent': numberContent,
        'integerContent': integerContent,
        'doubleContent': doubleContent,
        'stringContent': stringContent,
      };

  @override
  AnnotationSimpleSample fromJson(Map<String, dynamic> json) {
    id = getRequiredStringField(json, 'id');
    numberContent = getRequiredNumField(json, 'numberContent');
    integerContent = getRequiredIntField(json, 'integerContent');
    doubleContent = getRequiredDoubleField(json, 'doubleContent');
    stringContent = getRequiredStringField(json, 'stringContent');

    return this as AnnotationSimpleSample;
  }

  @override
  AnnotationSimpleSample instance() => AnnotationSimpleSample();

  @override
  String getId() => id;
}

abstract class AnnotationComplexSampleGen
    extends Object<AnnotationComplexSample> {
  abstract String id;
  abstract num numberContent;
  abstract int integerContent;
  abstract double doubleContent;
  abstract String stringContent;
  abstract AnnotationSimpleSample? sample;
  abstract List<AnnotationSimpleSample> list;
  abstract Map<String, AnnotationSimpleSample> map;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'numberContent': numberContent,
        'integerContent': integerContent,
        'doubleContent': doubleContent,
        'stringContent': stringContent,
        'sample': sample,
        'list': list,
        'map': map,
      };

  @override
  AnnotationComplexSample fromJson(Map<String, dynamic> json) {
    id = getRequiredStringField(json, 'id');
    numberContent = getRequiredNumField(json, 'numberContent');
    integerContent = getRequiredIntField(json, 'integerContent');
    doubleContent = getRequiredDoubleField(json, 'doubleContent');
    stringContent = getRequiredStringField(json, 'stringContent');
    sample = getInstanceOf(json, 'sample');
    list = getListOfInstances(json, 'list');
    map = getMapOfInstances(json, 'map');

    return this as AnnotationComplexSample;
  }

  @override
  AnnotationComplexSample instance() => AnnotationComplexSample();

  @override
  String getId() => id;
}
