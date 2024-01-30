// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:object/object.dart';

import 'model/annotation_complex_sample.dart';
import 'model/annotation_simple_sample.dart';
import 'model/simple_sample.dart';

void main() {
  group('Test simple serializer', () {
    test(
        'GIVEN valid serialization values WHEN serializing THEN the same content is produced',
        () {
      /// GIVEN
      final sample = AnnotationSimpleSample();

      const id = 'id';
      const number = 123;
      const boolean = true;
      const integer = 123;
      const double = 123.0;
      const string = 'string_content_';

      /// WHEN
      sample.fromJson({
        'id': id,
        'numberContent': number,
        'integerContent': integer,
        'doubleContent': double,
        'stringContent': string,
        'booleanContent': boolean,
      });

      /// THEN
      expect(sample.toJson(), {
        'id': 'id',
        'numberContent': 123,
        'integerContent': 123,
        'doubleContent': 123.0,
        'booleanContent': true,
        'stringContent': 'string_content_'
      });
    });

    test(
        'GIVEN not valid serialization values WHEN serializing THEN not the same content is produced, but does not crash',
        () {
      /// GIVEN

      final sample = AnnotationSimpleSample();

      const id = 3;
      const number = 'test';
      const integer = [1, 'df'];
      const double = true;
      const string = 3;

      /// WHEN
      sample.fromJson({
        'id': id,
        'numberContent': number,
        'integerContent': integer,
        'doubleContent': double,
        'stringContent': string,
      });

      /// THEN
      expect(sample.toJson(), {
        'id': '',
        'numberContent': 0,
        'integerContent': 0,
        'doubleContent': 0,
        'stringContent': '',
        'booleanContent': false
      });
    });
  });

  group('Test complex serializer', () {
    test(
        'GIVEN valid serialization values WHEN serializing THEN the same content is produced',
        () {
      /// GIVEN
      ObjectLib().prepareInstances(
        [
          AnnotationSimpleSample(),
          SimpleSample(),
        ],
      );
      final sample = AnnotationComplexSample();

      const id = 'id';
      const num number = 123;
      const int integer = 123;
      const double = 123.0;
      const boolean = true;
      const string = 'string_content_';

      var item = {
        'id': id,
        'numberContent': number,
        'integerContent': integer,
        'doubleContent': double,
        'stringContent': string,
        'booleanContent': boolean,
      };

      /// WHEN
      sample.fromJson({
        'id': id,
        'numberContent': number,
        'integerContent': integer,
        'doubleContent': double,
        'stringContent': string,
        'booleanContent': boolean,
        'sample': item,
        'simpleSample': item,
        'numList': [number],
        'intList': [integer],
        'doubleList': [double],
        'boolList': [boolean],
        'stringList': [string],
        'instancesList': [item],
        'intMap': {
          'sample': integer,
        },
        'doubleMap': {
          'sample': double,
        },
        'numMap': {
          'sample': number,
        },
        'boolMap': {
          'sample': boolean,
        },
        'stringMap': {
          'sample': string,
        },
        'instancesMap': {
          'sample': item,
        },
      });

      /// THEN
      expect(sample.toJson(), {
        'id': id,
        'numberContent': number,
        'integerContent': integer,
        'doubleContent': double,
        'stringContent': string,
        'booleanContent': boolean,
        'sample': item,
        'simpleSample': item,
        'numList': [number],
        'intList': [integer],
        'doubleList': [double],
        'boolList': [boolean],
        'stringList': [string],
        'instancesList': [item],
        'intMap': {
          'sample': integer,
        },
        'doubleMap': {
          'sample': double,
        },
        'numMap': {
          'sample': number,
        },
        'boolMap': {
          'sample': boolean,
        },
        'stringMap': {
          'sample': string,
        },
        'instancesMap': {
          'sample': item,
        },
      });
    });

    test(
        'GIVEN not valid serialization values WHEN serializing THEN not the same content is produced, but does not crash',
        () {
      /// GIVEN
      ObjectLib().prepareInstances(
        [
          AnnotationSimpleSample(),
          SimpleSample(),
        ],
      );
      final sample = AnnotationComplexSample();

      const id = 'id';
      const num number = 123;
      const int integer = 123;
      const double = 123.0;
      const boolean = true;
      const string = 'string_content_';

      var item = {
        'id': double,
        'numberContent': id,
        'integerContent': string,
        'doubleContent': boolean,
        'stringContent': number,
        'booleanContent': integer,
      };

      /// WHEN
      sample.fromJson({
        'id': id,
        'numberContent': string,
        'integerContent': string,
        'doubleContent': boolean,
        'stringContent': boolean,
        'booleanContent': string,
        'sample': item,
        'simpleSample': item,
        'numList': [boolean],
        'intList': [boolean],
        'doubleList': [boolean],
        'boolList': [string],
        'stringList': [boolean],
        'instancesList': [item],
        'intMap': {
          'sample': string,
        },
        'doubleMap': {
          'sample': string,
        },
        'numMap': {
          'sample': string,
        },
        'boolMap': {
          'sample': string,
        },
        'stringMap': {
          'sample': boolean,
        },
        'instancesMap': {
          'sample': item,
        },
      });

      /// THEN
      expect(sample.toJson(), {
        'id': id,
        'numberContent': 0,
        'integerContent': 0,
        'doubleContent': 0.0,
        'stringContent': '',
        'booleanContent': false,
        'sample': {
          'id': '',
          'numberContent': 0,
          'integerContent': 0,
          'doubleContent': 0.0,
          'stringContent': '',
          'booleanContent': false,
        },
        'simpleSample': {
          'id': '',
          'numberContent': 0,
          'integerContent': 0,
          'doubleContent': 0.0,
          'stringContent': '',
          'booleanContent': false,
        },
        'numList': [],
        'intList': [],
        'doubleList': [],
        'boolList': [],
        'stringList': [],
        'instancesList': [
          {
            'id': '',
            'numberContent': 0,
            'integerContent': 0,
            'doubleContent': 0.0,
            'stringContent': '',
            'booleanContent': false,
          },
        ],
        'intMap': {},
        'doubleMap': {},
        'numMap': {},
        'boolMap': {},
        'stringMap': {},
        'instancesMap': {
          'sample': {
            'id': '',
            'numberContent': 0,
            'integerContent': 0,
            'doubleContent': 0.0,
            'stringContent': '',
            'booleanContent': false,
          },
        },
      });
    });
  });
}
