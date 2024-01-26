import 'annotation_simple_sample.dart';
import 'generated/model.g.dart';

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
  @Field(name: 'stringContent')
  String stringContent = 'string_content';

  @override
  @Field(name: 'sample')
  AnnotationSimpleSample? sample;

  @override
  @Field(name: 'list')
  List<AnnotationSimpleSample> list = [];

  @override
  @Field(name: 'map')
  Map<String, AnnotationSimpleSample> map = {};

  AnnotationComplexSample();
}
