import 'package:example/model/annotation_simple_sample.dart';
import 'package:example/model/generated/model.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/annotation_complex_sample.dart';
import 'model/complex_sample.dart';
import 'model/simple_sample.dart';

void main() {
  Model().instancesForLoad(
    additional: [
      ComplexSample(),
      SimpleSample(),
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    AnnotationComplexSample constructorSample =
        AnnotationComplexSample().constructor(
      id: 'id',
      numberContent: 0,
      integerContent: 0,
      doubleContent: 0.0,
      stringContent: '',
      booleanContent: false,
      sample: AnnotationSimpleSample(),
      simpleSample: SimpleSample(),
      stringList: [],
      numList: [],
      doubleList: [],
      intList: [],
      boolList: [],
      instancesList: [],
      stringMap: {},
      numMap: {},
      doubleMap: {},
      intMap: {},
      boolMap: {},
      instancesMap: {},
    );

    SimpleSample? nullableSample = {
      'id': 'id',
      'numberContent': 1,
      'integerContent': 2,
      'doubleContent': 3.0,
      'stringContent': 'string',
      'booleanContent': true,
    }.asNullableInstance();

    SimpleSample sample = {
      'id': 'id',
      'numberContent': 1,
      'integerContent': 2,
      'doubleContent': 3.0,
      'stringContent': 'string',
      'booleanContent': true,
    }.asInstance(SimpleSample());

    final other = {
      'id': 'other',
      'numberContent': 1,
      'integerContent': 2,
      'doubleContent': 3.0,
      'stringContent': 'string',
      'booleanContent': true,
    }.asNullableInstance<SimpleSample>();

    List<SimpleSample> samples = [
      {
        'id': 'id',
        'numberContent': 1,
        'integerContent': 2,
        'doubleContent': 3.0,
        'stringContent': 'string',
        'booleanContent': true,
      },
      {
        'id': 'other',
        'numberContent': 1,
        'integerContent': 2,
        'doubleContent': 3.0,
        'stringContent': 'string',
        'booleanContent': true,
      }
    ].asInstanceList();

    final otherList = [
      {
        'id': 'id',
        'numberContent': 1,
        'integerContent': 2,
        'doubleContent': 3.0,
        'stringContent': 'string',
        'booleanContent': true,
      },
      {
        'id': 'other',
        'numberContent': 1,
        'integerContent': 2,
        'doubleContent': 3.0,
        'stringContent': 'string',
        'booleanContent': true,
      }
    ].asInstanceList<SimpleSample>();

    Map<String, SimpleSample> sampleMap = {
      'id': {
        'id': 'id',
        'numberContent': 1,
        'integerContent': 2,
        'doubleContent': 3.0,
        'stringContent': 'string',
        'booleanContent': true,
      },
      'other': {
        'id': 'other',
        'numberContent': 1,
        'integerContent': 2,
        'doubleContent': 3.0,
        'stringContent': 'string',
        'booleanContent': true,
      }
    }.asInstanceMap();

    final otherMap = {
      'id': {
        'id': 'id',
        'numberContent': 1,
        'integerContent': 2,
        'doubleContent': 3.0,
        'stringContent': 'string',
        'booleanContent': true,
      },
      'other': {
        'id': 'other',
        'numberContent': 1,
        'integerContent': 2,
        'doubleContent': 3.0,
        'stringContent': 'string',
        'booleanContent': true,
      }
    }.asInstanceMap<SimpleSample>();

    final boolList = [
      false,
      false,
      true,
    ].asBoolList();

    final doubleMap = [
      0.0,
      1.0,
      3.0,
    ].asDoubleList();

    if (kDebugMode) {
      print(constructorSample);
      print(nullableSample);
      print(sample);
      print(other);
      print(samples);
      print(otherList);
      print(sampleMap);
      print(otherMap);
      print(boolList);
      print(doubleMap);
    }

    final doubleValue = 'string'.asDouble();
    if (kDebugMode) {
      print(doubleValue); // prints 0.0
    }

    final boolValue = 77.asBool(defaultValue: true);
    if (kDebugMode) {
      print(boolValue); // prints true
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
