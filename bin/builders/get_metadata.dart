import 'dart:io';

import '../extensions/string_ext.dart';

Future<String?> findClassName(String path) async {
  try {
    File file = File(path);
    final content = await file.readAsString();
    return '${content.split("class ")[1].split(" ").first.trim()}';
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

    for (VariableInfo variable in vars) {
      print('name: ${variable.name}');
      print('type: ${variable.type}');
      print('identifier: ${variable.identifier}');
      print('nullable: ${variable.nullable}');
      print('primary: ${variable.primary}');
    }

    return vars;
  } catch (e) {
    print('Error getting metadata from $path');
    print(e);
    return [];
  }
}

class VariableInfo {
  final bool primary;
  final bool nullable;
  final String identifier;
  final String name;
  final String type;

  VariableInfo({
    required this.primary,
    required this.nullable,
    required this.identifier,
    required this.name,
    required this.type,
  });

  String typeForImplement() {
    final cleanType = type.contains('?') ? type.replaceAll('?', '') : type;
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
    parts.add(variableInfo(code));
  }
  return parts;
}

VariableInfo variableInfo(String code) {
  /**
   * (name: 'numberContent')
      num numberContent = 0
   */

  final primary = getPrimary(code);
  final identifier = getIdentifier(code);
  final type = getType(code);
  final name = getName(code, type);

  return VariableInfo(
    nullable: type.endsWith('?'),
    identifier: identifier,
    primary: primary,
    name: name,
    type: type,
  );
}

String getIdentifier(String code) {
  final p = code.split('name: \'')[1];
  return p.split('\'').first.trim();
}

bool getPrimary(String code) {
  if (!code.contains('primary:')) {
    return false;
  }
  final p = code.split('primary: ')[1];
  return p.split(')').first.replaceAll(',', '').trim() == 'true';
}

String getType(String code) {
  print('code: $code');
  final p = code.split(')')[1].trim();
  return p.split(' ').first.trim();
}

String getName(String code, String type) {
  final p = code.split('$type ')[1];
  return p.split(' =').first.trim();
}
