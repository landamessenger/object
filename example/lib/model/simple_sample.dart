import 'package:object/object.dart';

class SimpleSample extends Object<SimpleSample> {
  num numberContent = 0;

  int integerContent = 0;

  double doubleContent = 0.0;

  String stringContent = 'string_content';

  SimpleSample();

  @override
  Map<String, dynamic> toJson() => {
        'numberContent': numberContent,
        'integerContent': integerContent,
        'doubleContent': doubleContent,
        'stringContent': stringContent,
      };

  @override
  SimpleSample fromJson(Map<String, dynamic> json) {
    numberContent = getRequiredNumField(json, 'numberContent');
    integerContent = getRequiredIntField(json, 'integerContent');
    doubleContent = getRequiredDoubleField(json, 'doubleContent');
    stringContent = getRequiredStringField(json, 'stringContent');
    return this;
  }

  @override
  String getId() => '';

  @override
  SimpleSample instance() => SimpleSample();
}
