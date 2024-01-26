import 'get_metadata.dart';

String getObjectClassFor(
    String clazz, String clazzSuffix, List<VariableInfo> variables) {
  String variablesDeclaration = getVariablesDeclaration(variables);
  String variablesToJson = getVariablesToJson(variables);
  String variablesFromJson = getVariablesFromJson(variables);
  String? primaryGetter = getPrimaryDeclaration(variables);

  String content = '''
\n

abstract class $clazz$clazzSuffix extends Object<$clazz> {

  $variablesDeclaration

  @override
  Map<String, dynamic> toJson() => {
        $variablesToJson
      };

  @override
  $clazz fromJson(Map<String, dynamic> json) {
    $variablesFromJson
    return this as $clazz;
  }

  @override
  $clazz instance() => $clazz();
  
  ${primaryGetter ?? ''}
}
  ''';

  return content;
}

String getVariablesDeclaration(List<VariableInfo> variables) {
  String declarations = '\n';

  for (VariableInfo variableInfo in variables) {
    String variable = 'abstract ${variableInfo.type} ${variableInfo.name};\n';
    declarations += variable;
  }

  return declarations;
}

String getVariablesToJson(List<VariableInfo> variables) {
  String declarations = '\n';

  for (VariableInfo variableInfo in variables) {
    String variable = '\'${variableInfo.identifier}\': ${variableInfo.name},\n';
    declarations += variable;
  }

  return declarations;
}

String getVariablesFromJson(List<VariableInfo> variables) {
  String declarations = '\n';

  for (VariableInfo variableInfo in variables) {
    if (variableInfo.map) {
      String variable =
          '${variableInfo.name} = getMapOfInstances(json, \'${variableInfo.identifier}\');\n';
      declarations += variable;
    } else if (variableInfo.list) {
      String variable =
          '${variableInfo.name} = getListOfInstances(json, \'${variableInfo.identifier}\');\n';
      declarations += variable;
    } else if (!variableInfo.primitive) {
      String variable =
          '${variableInfo.name} = getInstanceOf(json, \'${variableInfo.identifier}\');\n';
      declarations += variable;
    } else if (variableInfo.nullable) {
      String variable =
          '${variableInfo.name} = get${variableInfo.typeForImplement()}Field(json, \'${variableInfo.identifier}\');\n';
      declarations += variable;
    } else {
      String variable =
          '${variableInfo.name} = getRequired${variableInfo.typeForImplement()}Field(json, \'${variableInfo.identifier}\');\n';
      declarations += variable;
    }
  }

  return declarations;
}

String? getPrimaryDeclaration(List<VariableInfo> variables) {
  for (VariableInfo variableInfo in variables) {
    if (variableInfo.primary) {
      return '''
  @override
  String getId() => ${variableInfo.name};
''';
    }
  }

  return null;
}
