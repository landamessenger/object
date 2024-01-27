import 'package:object/object.dart';

class SimpleSample extends Object<SimpleSample> {
  String id = '';

  num numberContent = 0;

  int integerContent = 0;

  double doubleContent = 0.0;

  bool booleanContent = true;

  String stringContent = 'string_content';

  SimpleSample();

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
  SimpleSample fromJson(Map<String, dynamic> json) {
    id = getRequiredStringField(json, 'id');
    numberContent = getRequiredNumField(json, 'numberContent');
    integerContent = getRequiredIntField(json, 'integerContent');
    doubleContent = getRequiredDoubleField(json, 'doubleContent');
    stringContent = getRequiredStringField(json, 'stringContent');
    booleanContent = getRequiredBoolField(json, 'booleanContent');
    return this;
  }

  @override
  String getId() => id;

  @override
  SimpleSample instance() => SimpleSample();
}
