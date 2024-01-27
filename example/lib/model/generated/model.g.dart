import 'package:object/object.dart';

export 'package:object/object.dart';

import 'package:example/model/annotation_simple_sample.dart';
import 'package:example/model/annotation_complex_sample.dart';
import 'package:example/model/simple_sample.dart';

abstract class AnnotationSimpleSampleGen
    extends Object<AnnotationSimpleSample> {
  abstract String id;
  abstract num numberContent;
  abstract int integerContent;
  abstract double doubleContent;
  abstract String stringContent;
  abstract bool booleanContent;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'numberContent': numberContent,
        'integerContent': integerContent,
        'doubleContent': doubleContent,
        'stringContent': stringContent,
        'booleanContent': booleanContent,
      };

  @override
  AnnotationSimpleSample fromJson(Map<String, dynamic> json) {
    id = getRequiredStringField(json, 'id');
    numberContent = getRequiredNumField(json, 'numberContent');
    integerContent = getRequiredIntField(json, 'integerContent');
    doubleContent = getRequiredDoubleField(json, 'doubleContent');
    stringContent = getRequiredStringField(json, 'stringContent');
    booleanContent = getRequiredBoolField(json, 'booleanContent');

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
  abstract bool booleanContent;
  abstract AnnotationSimpleSample? sample;
  abstract SimpleSample? simpleSample;
  abstract List<String> stringList;
  abstract List<num> numList;
  abstract List<double> doubleList;
  abstract List<int> intList;
  abstract List<bool> boolList;
  abstract List<AnnotationSimpleSample> instancesList;
  abstract Map<String, String> stringMap;
  abstract Map<String, num> numMap;
  abstract Map<String, double> doubleMap;
  abstract Map<String, int> intMap;
  abstract Map<String, bool> boolMap;
  abstract Map<String, AnnotationSimpleSample> instancesMap;

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'numberContent': numberContent,
        'integerContent': integerContent,
        'doubleContent': doubleContent,
        'stringContent': stringContent,
        'booleanContent': booleanContent,
        'sample': sample?.toJson(),
        'simpleSample': simpleSample?.toJson(),
        'stringList': stringList,
        'numList': numList,
        'doubleList': doubleList,
        'intList': intList,
        'boolList': boolList,
        'instancesList': instancesList.toJson(),
        'stringMap': stringMap,
        'numMap': numMap,
        'doubleMap': doubleMap,
        'intMap': intMap,
        'boolMap': boolMap,
        'instancesMap': instancesMap.toJson(),
      };

  @override
  AnnotationComplexSample fromJson(Map<String, dynamic> json) {
    id = getRequiredStringField(json, 'id');
    numberContent = getRequiredNumField(json, 'numberContent');
    integerContent = getRequiredIntField(json, 'integerContent');
    doubleContent = getRequiredDoubleField(json, 'doubleContent');
    stringContent = getRequiredStringField(json, 'stringContent');
    booleanContent = getRequiredBoolField(json, 'booleanContent');
    sample = getInstanceOf(json, 'sample');
    simpleSample = getInstanceOf(json, 'simpleSample');
    stringList = getListOfString(json, 'stringList');
    numList = getListOfNum(json, 'numList');
    doubleList = getListOfDouble(json, 'doubleList');
    intList = getListOfInt(json, 'intList');
    boolList = getListOfBool(json, 'boolList');
    instancesList = getListOfInstances(json, 'instancesList');
    stringMap = getMapOfString(json, 'stringMap');
    numMap = getMapOfNum(json, 'numMap');
    doubleMap = getMapOfDouble(json, 'doubleMap');
    intMap = getMapOfInt(json, 'intMap');
    boolMap = getMapOfBool(json, 'boolMap');
    instancesMap = getMapOfInstances(json, 'instancesMap');

    return this as AnnotationComplexSample;
  }

  @override
  AnnotationComplexSample instance() => AnnotationComplexSample();

  @override
  String getId() => id;
}
