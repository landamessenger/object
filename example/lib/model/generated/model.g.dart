/// AUTOGENERATED FILE, DO NOT EDIT
///
/// REBUILD WITH:
///
/// dart run object:build
///

import 'package:object/object.dart';

export 'package:object/object.dart';

import 'package:example/model/annotation_simple_sample.dart';
import 'package:example/model/annotation_complex_sample.dart';
import 'package:example/model/simple_sample.dart';

class Model extends ObjectModel {
  static Model? _instance;

  Model._internal();

  factory Model() {
    _instance ??= Model._internal();
    return _instance!;
  }

  final List<dynamic> _instances = [
    AnnotationComplexSample(),
    AnnotationSimpleSample(),
  ];

  @override
  void instancesForLoad({List<dynamic> additional = const []}) {
    final i = <dynamic>[];
    i.addAll(_instances);
    i.addAll(additional);
    ObjectLib().prepareInstances(i);
  }
}

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

    onInstanceCreated();

    return this as AnnotationSimpleSample;
  }

  @override
  AnnotationSimpleSample instance() => AnnotationSimpleSample();

  AnnotationSimpleSample constructor({
    required String id,
    required num numberContent,
    required int integerContent,
    required double doubleContent,
    required String stringContent,
    required bool booleanContent,
  }) {
    this.id = id;
    this.numberContent = numberContent;
    this.integerContent = integerContent;
    this.doubleContent = doubleContent;
    this.stringContent = stringContent;
    this.booleanContent = booleanContent;

    onInstanceCreated();

    return this as AnnotationSimpleSample;
  }

  AnnotationSimpleSample constructorWith({
    String? id,
    num? numberContent,
    int? integerContent,
    double? doubleContent,
    String? stringContent,
    bool? booleanContent,
  }) {
    this.id = id ?? this.id;
    this.numberContent = numberContent ?? this.numberContent;
    this.integerContent = integerContent ?? this.integerContent;
    this.doubleContent = doubleContent ?? this.doubleContent;
    this.stringContent = stringContent ?? this.stringContent;
    this.booleanContent = booleanContent ?? this.booleanContent;

    onInstanceCreated();

    return this as AnnotationSimpleSample;
  }

  @override
  String getId() => id;

  void onInstanceCreated() {
    // nothing to do here
  }
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

    onInstanceCreated();

    return this as AnnotationComplexSample;
  }

  @override
  AnnotationComplexSample instance() => AnnotationComplexSample();

  AnnotationComplexSample constructor({
    required String id,
    required num numberContent,
    required int integerContent,
    required double doubleContent,
    required String stringContent,
    required bool booleanContent,
    required AnnotationSimpleSample? sample,
    required SimpleSample? simpleSample,
    required List<String> stringList,
    required List<num> numList,
    required List<double> doubleList,
    required List<int> intList,
    required List<bool> boolList,
    required List<AnnotationSimpleSample> instancesList,
    required Map<String, String> stringMap,
    required Map<String, num> numMap,
    required Map<String, double> doubleMap,
    required Map<String, int> intMap,
    required Map<String, bool> boolMap,
    required Map<String, AnnotationSimpleSample> instancesMap,
  }) {
    this.id = id;
    this.numberContent = numberContent;
    this.integerContent = integerContent;
    this.doubleContent = doubleContent;
    this.stringContent = stringContent;
    this.booleanContent = booleanContent;
    this.sample = sample;
    this.simpleSample = simpleSample;
    this.stringList = stringList;
    this.numList = numList;
    this.doubleList = doubleList;
    this.intList = intList;
    this.boolList = boolList;
    this.instancesList = instancesList;
    this.stringMap = stringMap;
    this.numMap = numMap;
    this.doubleMap = doubleMap;
    this.intMap = intMap;
    this.boolMap = boolMap;
    this.instancesMap = instancesMap;

    onInstanceCreated();

    return this as AnnotationComplexSample;
  }

  AnnotationComplexSample constructorWith({
    String? id,
    num? numberContent,
    int? integerContent,
    double? doubleContent,
    String? stringContent,
    bool? booleanContent,
    AnnotationSimpleSample? sample,
    SimpleSample? simpleSample,
    List<String>? stringList,
    List<num>? numList,
    List<double>? doubleList,
    List<int>? intList,
    List<bool>? boolList,
    List<AnnotationSimpleSample>? instancesList,
    Map<String, String>? stringMap,
    Map<String, num>? numMap,
    Map<String, double>? doubleMap,
    Map<String, int>? intMap,
    Map<String, bool>? boolMap,
    Map<String, AnnotationSimpleSample>? instancesMap,
  }) {
    this.id = id ?? this.id;
    this.numberContent = numberContent ?? this.numberContent;
    this.integerContent = integerContent ?? this.integerContent;
    this.doubleContent = doubleContent ?? this.doubleContent;
    this.stringContent = stringContent ?? this.stringContent;
    this.booleanContent = booleanContent ?? this.booleanContent;
    this.sample = sample ?? this.sample;
    this.simpleSample = simpleSample ?? this.simpleSample;
    this.stringList = stringList ?? this.stringList;
    this.numList = numList ?? this.numList;
    this.doubleList = doubleList ?? this.doubleList;
    this.intList = intList ?? this.intList;
    this.boolList = boolList ?? this.boolList;
    this.instancesList = instancesList ?? this.instancesList;
    this.stringMap = stringMap ?? this.stringMap;
    this.numMap = numMap ?? this.numMap;
    this.doubleMap = doubleMap ?? this.doubleMap;
    this.intMap = intMap ?? this.intMap;
    this.boolMap = boolMap ?? this.boolMap;
    this.instancesMap = instancesMap ?? this.instancesMap;

    onInstanceCreated();

    return this as AnnotationComplexSample;
  }

  @override
  String getId() => id;

  void onInstanceCreated() {
    // nothing to do here
  }
}
