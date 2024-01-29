# Object

[![Pub Version](https://img.shields.io/pub/v/object.svg)](https://pub.dev/packages/object)
[![Build Status](https://travis-ci.org/landamessenger/object.svg?branch=master)](https://travis-ci.org/landamessenger/object)
[![Coverage Status](https://coveralls.io/repos/github/landamessenger/object/badge.svg?branch=master)](https://coveralls.io/github/landamessenger/object?branch=master)

The `object` library provides utilities for serializing and deserializing Dart objects to and from JSON format. This library simplifies the process of converting Dart objects to JSON and vice versa, making it easier to work with JSON data in Dart applications.

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

Define Dart classes that you want to serialize or deserialize. Annotate these classes with the necessary annotations from the generated file from the `object` package to specify serialization behavior.

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

  @override
  @Field(
    name: 'ref',
    basic: true,
    import: 'package:cloud_firestore/cloud_firestore.dart',
  )
  DocumentReference? ref;

  @override
  @Field(
    name: 'role',
    defaultValue: DefaultValue(
      value: 'client',
    ),
  )
  String role = '';

  @override
  @Field(name: 'creationDate')
  DateTime? creationDate;

  @override
  @Field(
    name: 'device',
    recycle: true,
  )
  Device? device;

  @override
  @Field(
    name: 'info',
    recycle: true,
    import: 'package:app_package/models/info.dart',
  )
  Info? info;

  Sample();
}
```

### 2. Generate Serialization Code

Run the object builder to generate serialization code for your annotated Dart classes.

```bash
dart run object:build
```

This command generates serialization code based on the annotations in your Dart files.

### 3. Configure the classes

Configure the classes you will use with the `object` library.

```dart
import 'package:flutter/material.dart';
import 'package:object/object.dart';

import 'model/sample.dart';

void main() {
  /// From your pubspec.yaml configuration:
  /// 
  /// modelsFile: 'model.g.dart'
  /// 
  /// generates the [Model] class:
  Model().instancesForLoad();
  runApp(const MyApp());
}
```

You can include other classes with no `@Field` annotation but that implement the `Object<T>` contract of the library.

```dart
Model().instancesForLoad(
  additional: [
    OtherClass(),
  ],
);
```

### 4. Serialize and Deserialize Objects

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

## Field

The @Field annotation allows you to de/serialize Dart instances easily. It offers different parameters:

```dart
class Field {
  /// Sets the current field as the primary key which will difference that
  /// instance of others.
  final bool primary;

  /// Sets if the current field should have a basic de/serialization.
  ///
  /// toJson() -> 'field': instance['field']
  ///
  /// fromJson() -> instance['field'] = json['field']
  ///
  final bool basic;

  /// Defines the current field for being recycle on the deserialization
  /// process. Instead of create a new instance of the field, the library will
  /// use the old one, for avoiding memory consumption.
  ///
  /// This field only applies on complex instances, not on primitive types.
  final bool recycle;

  /// Key for de/serialization
  final String name;

  /// Helps de/serializing instances whose classes are not managed by the
  /// library.
  final String import;

  /// Default value for primitive types.
  final DefaultValue? defaultValue;

  const Field({
    required this.name,
    this.import = '',
    this.defaultValue,
    this.primary = false,
    this.basic = false,
    this.recycle = false,
  });
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
