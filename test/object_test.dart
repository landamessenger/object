// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:object/object.dart';

import '../example/lib/model/complex_sample.dart';
import '../example/lib/model/simple_sample.dart';

void main() {
  group('Test simple serializer', () {
    test(
        'GIVEN valid serialization values WHEN serializing THEN the same content is produced',
        () {
      /// GIVEN
      final sample = SimpleSample();

      const number = 123;
      const integer = 123;
      const double = 123.0;
      const string = 'id';

      /// WHEN
      sample.fromJson({
        'numberContent': number,
        'integerContent': integer,
        'doubleContent': double,
        'stringContent': string,
      });

      /// THEN
      expect(sample.toJson(), {
        'numberContent': 123,
        'integerContent': 123,
        'doubleContent': 123.0,
        'stringContent': 'id'
      });
    });

    test(
        'GIVEN not valid serialization values WHEN serializing THEN not the same content is produced, but does not crash',
        () {
      /// GIVEN

      final sample = SimpleSample();

      const number = 'test';
      const integer = [1, 'df'];
      const double = true;
      const string = 3;

      /// WHEN
      sample.fromJson({
        'numberContent': number,
        'integerContent': integer,
        'doubleContent': double,
        'stringContent': string,
      });

      /// THEN
      expect(sample.toJson(), {
        'numberContent': 0,
        'integerContent': 0,
        'doubleContent': 0,
        'stringContent': ''
      });
    });
  });

  group('Test complex serializer', () {
    test(
        'GIVEN valid serialization values WHEN serializing THEN the same content is produced',
        () {
      /// GIVEN
      ObjectLib().addInstances(
        [
          SimpleSample(),
        ],
      );
      final sample = ComplexSample();

      const number = 123;
      const integer = 123;
      const double = 123.0;
      const string = 'id';

      var item = {
        'numberContent': number,
        'integerContent': integer,
        'doubleContent': double,
        'stringContent': string,
      };

      /// WHEN
      sample.fromJson({
        'sample': item,
        'list': [item],
        'map': {
          'sample': item,
        },
      });

      /// THEN
      expect(sample.toJson(), {
        'sample': {
          'numberContent': number,
          'integerContent': integer,
          'doubleContent': double,
          'stringContent': string,
        },
        'list': [
          {
            'numberContent': number,
            'integerContent': integer,
            'doubleContent': double,
            'stringContent': string,
          }
        ],
        'map': {
          'sample': {
            'numberContent': number,
            'integerContent': integer,
            'doubleContent': double,
            'stringContent': string,
          },
        },
      });
    });

    test(
        'GIVEN not valid serialization values WHEN serializing THEN not the same content is produced, but does not crash',
        () {
      /// GIVEN

      final sample = ComplexSample();

      const number = 'test';
      const integer = [1, 'df'];
      const double = true;
      const string = 3;

      /// WHEN
      sample.fromJson({
        'sample': number,
        'map': integer,
        'list': double,
        'stringContent': string,
      });

      /// THEN
      expect(sample.toJson(), {
        'sample': null,
        'list': [],
        'map': {},
      });
    });
  });
}
