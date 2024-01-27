import 'generated/model.g.dart';

class AnnotationSimpleSample extends AnnotationSimpleSampleGen {
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
  @Field(name: 'booleanContent')
  bool booleanContent = true;

  AnnotationSimpleSample();
}
