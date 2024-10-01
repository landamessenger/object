import 'annotation_simple_sample.dart';
import 'generated/model.g.dart';
import 'simple_sample.dart';

class AnnotationComplexSample extends AnnotationComplexSampleGen {
  @override
  @Field(
    name: 'id',
    primary: true,
  )
  String id = '';

  @override
  @Field(name: 'numberContent')
  num numberContent = 0;

  @override
  @Field(name: 'integerContent')
  int integerContent = 0;

  @override
  @Field(name: 'doubleContent')
  double doubleContent = 0.0;

  @override
  @Field(name: 'booleanContent')
  bool booleanContent = true;

  @override
  @Field(name: 'stringContent')
  String stringContent = '';

  @override
  @Field(
    name: 'sample',
  )
  AnnotationSimpleSample? sample;

  @override
  @Field(
    name: 'simpleSample',
    import: 'package:example/model/simple_sample.dart',
  )
  SimpleSample? simpleSample;

  @override
  @Field(name: 'stringList')
  List<String> stringList = [];

  @override
  @Field(name: 'numList')
  List<num> numList = [];

  @override
  @Field(name: 'doubleList')
  List<double> doubleList = [];

  @override
  @Field(name: 'intList')
  List<int> intList = [];

  @override
  @Field(name: 'boolList')
  List<bool> boolList = [];

  @override
  @Field(name: 'instancesList')
  List<AnnotationSimpleSample> instancesList = [];

  @override
  @Field(name: 'stringMap')
  Map<String, String> stringMap = {};

  @override
  @Field(name: 'numMap')
  Map<String, num> numMap = {};

  @override
  @Field(name: 'doubleMap')
  Map<String, double> doubleMap = {};

  @override
  @Field(name: 'intMap')
  Map<String, int> intMap = {};

  @override
  @Field(name: 'boolMap')
  Map<String, bool> boolMap = {};

  @override
  @Field(name: 'instancesMap')
  Map<String, AnnotationSimpleSample> instancesMap = {};

  AnnotationComplexSample();
}
