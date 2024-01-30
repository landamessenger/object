import 'dart:io';

import '../extensions/string_ext.dart';

Future<String?> findClassName(String path) async {
  try {
    File file = File(path);
    final content = await file.readAsString();
    return content.split("class ")[1].split(" ").first.trim();
  } catch (e) {
    print(e);
    return null;
  }
}

Future<List<VariableInfo>> findVariables(String path) async {
  try {
    File file = File(path);
    final content = await file.readAsString();

    final vars = getVars(content);

    /*
     for (VariableInfo variable in vars) {
      // print('============================================');
      // print('- ${variable.name}');

      print('type: ${variable.type}');
      print('internalType: ${variable.internalType}');
      print('primitive: ${variable.primitive}');
      print('identifier: ${variable.identifier}');
      print('additionalImport: ${variable.additionalImport}');
      print('nullable: ${variable.nullable}');
      print('primary: ${variable.primary}');
      print('defaultValue: ${variable.defaultValue}');
      print('map: ${variable.map}');
      print('list: ${variable.list}');
    }
       */

    return vars;
  } catch (e) {
    print('Error getting metadata from $path');
    print(e);
    return [];
  }
}

class VariableInfo {
  final bool basic;
  final bool primary;
  final bool nullable;
  final bool list;
  final bool map;
  final bool primitive;
  final bool recycle;
  final bool date;
  final bool dynamic;
  final String additionalImport;
  final String identifier;
  final String name;
  final String type;
  final String internalType;
  final String defaultValue;

  VariableInfo({
    required this.basic,
    required this.primary,
    required this.recycle,
    required this.dynamic,
    required this.date,
    required this.nullable,
    required this.identifier,
    required this.additionalImport,
    required this.name,
    required this.type,
    required this.internalType,
    required this.list,
    required this.map,
    required this.primitive,
    required this.defaultValue,
  });

  String typeForImplement() {
    final cleanType = internalType.contains('?')
        ? internalType.replaceAll('?', '')
        : internalType;
    return cleanType.capitalize();
  }
}

/// Item output sample:
///
/// (name: 'numberContent')
///   num numberContent = 0
List<VariableInfo> getVars(String content) {
  final parts = <VariableInfo>[];
  final ps = content.split('@Field');
  ps.removeAt(0);
  for (final p in ps) {
    final code = p.split(';').firstOrNull ?? '';
    parts.add(getVariableInfo(code));
  }
  return parts;
}

VariableInfo getVariableInfo(String code) {
  /**
   * (name: 'numberContent')
      num numberContent = 0
   */

  final defaultValue = getDefault(code);
  final primary = getPrimary(code);
  final recycle = getRecycle(code);
  final basic = getBasic(code);
  final additionalImport = getAdditionalImport(code);
  final type = getType(code);
  final internalType = getInternalType(type);
  final isDate = isDateTime(internalType);
  final dynamic = isDynamic(internalType);
  final map = isMap(type);
  final list = isList(type);
  final identifier = getIdentifier(code);
  final primitive = isPrimitiveType(internalType);
  final name = getName(code, type);

  return VariableInfo(
    nullable: type.endsWith('?'),
    identifier: identifier,
    recycle: recycle,
    primary: primary,
    basic: basic,
    name: name,
    type: type,
    map: map,
    list: list,
    primitive: primitive,
    date: isDate,
    dynamic: dynamic,
    internalType: internalType,
    additionalImport: additionalImport,
    defaultValue: defaultValue,
  );
}

String getIdentifier(String code) {
  final p = code.split('name: \'')[1];
  return p.split('\'').first.trim();
}

String getDefault(String code) {
  if (!code.contains('defaultValue:')) {
    return '';
  }

  final p = code.split('defaultValue:')[1].trim();
  final p2 = p.split('value:')[1].trim();
  var p3 = p2.split(')').first.trim();
  if (p3.trim().endsWith(',')) {
    p3 = p3.trim().substring(0, p3.length - 1);
  }
  return p3.trim();
}

bool getPrimary(String code) {
  if (!code.contains('primary:')) {
    return false;
  }
  final p = code.split('primary:')[1].trim();
  return p.startsWith('true');
}

bool getBasic(String code) {
  if (!code.contains('basic:')) {
    return false;
  }
  final p = code.split('basic:')[1].trim();
  return p.startsWith('true');
}

bool getRecycle(String code) {
  if (!code.contains('recycle:')) {
    return false;
  }
  final p = code.split('recycle:')[1].trim();
  return p.startsWith('true');
}

String getAdditionalImport(String code) {
  if (!code.contains('import: \'')) {
    return '';
  }
  final p = code.split('import: \'')[1];
  return p.split('\'').first;
}

String getType(String code) {
  final p = code.split(')').last.trim();
  if (code.contains('Map<')) {
    return ('${p.split('> ').first}>').trim();
  }
  return p.split(' ').first.trim();
}

bool isMap(String type) {
  return type.contains('Map<');
}

bool isList(String type) {
  return type.contains('List<');
}

String getInternalType(String type) {
  if (isMap(type)) {
    return type.split(',')[1].split('>').first.trim();
  } else if (isList(type)) {
    return type.split('<')[1].split('>').first.trim();
  }
  return type.trim();
}

bool isDateTime(String type) {
  final clean = type.replaceAll('?', '').trim();
  return clean == 'DateTime';
}

bool isDynamic(String type) {
  final clean = type.replaceAll('?', '').trim();
  return clean == 'dynamic';
}

bool isPrimitiveType(String type) {
  final clean = type.replaceAll('?', '').trim();
  final primitives = ['num', 'int', 'double', 'String', 'bool'];
  return primitives.contains(clean);
}

String getName(String code, String type) {
  final p = code.split('$type ')[1];
  return p.split(' =').first.trim();
}
