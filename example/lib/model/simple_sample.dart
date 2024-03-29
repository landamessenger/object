import 'package:object/object.dart';

class SimpleSample extends Object<SimpleSample> {
  num numberContent = 0;

  int integerContent = 0;

  double doubleContent = 0.0;

  String stringContent = 'string_content';

  bool booleanContent = true;

  SimpleSample();

  @override
  Map<String, dynamic> toJson() => {
        'numberContent': numberContent,
        'integerContent': integerContent,
        'doubleContent': doubleContent,
        'stringContent': stringContent,
        'booleanContent': booleanContent,
      };

  @override
  SimpleSample fromJson(Map<String, dynamic> json) {
    numberContent = getRequiredNumField(json, 'numberContent');
    integerContent = getRequiredIntField(json, 'integerContent');
    doubleContent = getRequiredDoubleField(json, 'doubleContent');
    stringContent = getRequiredStringField(json, 'stringContent');
    booleanContent = getRequiredBoolField(json, 'booleanContent');
    return this;
  }

  @override
  String getId() => '';

  @override
  SimpleSample instance() => SimpleSample();
}
