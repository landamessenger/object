# Object

[![Pub Version](https://img.shields.io/pub/v/object.svg)](https://pub.dev/packages/object)
[![Build Status](https://travis-ci.org/landamessenger/object.svg?branch=master)](https://travis-ci.org/landamessenger/object)
[![Coverage Status](https://coveralls.io/repos/github/landamessenger/object/badge.svg?branch=master)](https://coveralls.io/github/landamessenger/object?branch=master)

The Object library provides utilities for serializing and deserializing Dart objects to and from JSON format. This library simplifies the process of converting Dart objects to JSON and vice versa, making it easier to work with JSON data in Dart applications.

## Features

- Automatic generation of serialization code for Dart classes using annotations.
- Support for serializing and deserializing JSON data with minimal boilerplate code.
- Customizable serialization behavior through annotations and configuration options.
- Compatibility with popular Dart frameworks and tools, including Flutter.

## Installation

To use the Object library in your Flutter/Dart project, add it as a dependency in your `pubspec.yaml` file and configure it:

```yaml
dependencies:
  object: ^1.0.0

object:
  baseProjectFolder: 'lib'
  outputFolder: 'model/generated'
  modelsFile: 'model.g.dart'
  generationClassSuffix: 'Gen'
```

Then, run `flutter pub get` to install the library.

## Usage

### 1. Define Dart Classes

Define Dart classes that you want to serialize or deserialize. Annotate these classes with the necessary annotations from the `json_serializable` package to specify serialization behavior.

> `sample.dart` in `model/` folder

```dart
import 'generated/model.g.dart';

class Sample extends SampleGen {
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

  Sample();
}
```

### 2. Generate Serialization Code

Run the object builder to generate serialization code for your annotated Dart classes.

```bash
dart run object:build
```

This command generates serialization code based on the annotations in your Dart files.

### 3. Serialize and Deserialize Objects

Use the generated `toJson()` and `fromJson()` methods to serialize and deserialize objects to and from JSON format.

```dart
void main() {
  // Deserialize JSON to Dart object
  Map<String, dynamic> json = {
    'id': '_id',
    'numberContent': 30,
    // any other data..
  };
  Sample sample = Sample().fromJson(json);
  
  // Serialize Dart object to JSON
  Map<String, dynamic> serializedJson = sample.toJson();
}
```

For more information and advanced usage, refer to the [documentation](https://pub.dev/packages/object).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
