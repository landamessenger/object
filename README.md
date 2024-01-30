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

Working with instances never was easiest.

```dart
SimpleSample? sample = {
  'id': 'id',
  'numberContent': 1,
  'integerContent': 2,
  'doubleContent': 3.0,
  'stringContent': 'string',
  'booleanContent': true,
}.asNullableInstance();
```

### [Home](https://github.com/landamessenger/object/wiki)

### [Installation](https://github.com/landamessenger/object/wiki/Installation)

### [Classes](https://github.com/landamessenger/object/wiki/Classes)

[- Generate Serialization Code](https://github.com/landamessenger/object/wiki/Classes#generate-serialization-code)

### [Field Annotation](https://github.com/landamessenger/object/wiki/Field-Annotation)

### [Instances](https://github.com/landamessenger/object/wiki/Instances)

[- Create new instances](https://github.com/landamessenger/object/wiki/Instances#create-new-instances)

[- Create a list of instances](https://github.com/landamessenger/object/wiki/Instances#create-a-list-of-instances)

[- Create a map of instances](https://github.com/landamessenger/object/wiki/Instances#create-a-map-of-instances)

[- Other types of instances](https://github.com/landamessenger/object/wiki/Instances#other-types-of-instances)

[- Conversion safety](https://github.com/landamessenger/object/wiki/Instances#conversion-safety)
