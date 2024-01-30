// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:object/object.dart';

import 'model/complex_sample.dart';
import 'model/simple_sample.dart';

void main() {
  group('Safety test', () {
    test(
        'default values working',
        () {
          final doubleValue = 'string'.asDouble();
          print(doubleValue); // prints 0.0

          final boolValue = 77.asBool(defaultValue: true);
          print(boolValue); // prints true

          expect(doubleValue, 0);
          expect(boolValue, true);
    });
  });

}
