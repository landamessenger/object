import 'get_metadata.dart';

String getObjectClassFor(
  String clazz,
  String clazzSuffix,
  List<VariableInfo> variables,
) {
  String variablesDeclaration = getVariablesDeclaration(variables);
  String variablesToJson = getVariablesToJson(variables);
  String variablesFromJson = getVariablesFromJson(variables);
  String parametersConstructor = getParametersConstructor(variables);
  String variablesConstructor = getVariablesConstructor(variables);
  String parametersConstructorOptional = getParametersConstructorOptional(variables);
  String variablesConstructorOptional = getVariablesConstructorOptional(variables);
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
    
    onInstanceCreated();
    
    return this as $clazz;
  }

  @override
  $clazz instance() => $clazz();
  
  $clazz constructor({
    $parametersConstructor
  }) {
    $variablesConstructor

    onInstanceCreated();

    return this as $clazz;
  }
  
  $clazz constructorWith({
    $parametersConstructorOptional
  }) {
    $variablesConstructorOptional

    onInstanceCreated();

    return this as $clazz;
  }
  
  $primaryGetter
  
  void onInstanceCreated() {
    // nothing to do here
  }
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
    if (variableInfo.basic || variableInfo.dynamic) {
      String variable =
          '\'${variableInfo.identifier}\': ${variableInfo.name},\n';
      declarations += variable;
    } else if (!variableInfo.primitive) {
      if (variableInfo.date) {
        String variable =
            '\'${variableInfo.identifier}\': ${variableInfo.name}${variableInfo.nullable ? '?' : ''}.toString(),\n';
        declarations += variable;
      } else {
        String variable =
            '\'${variableInfo.identifier}\': ${variableInfo.name}${variableInfo.nullable ? '?' : ''}.toJson(),\n';
        declarations += variable;
      }
    } else {
      String variable =
          '\'${variableInfo.identifier}\': ${variableInfo.name},\n';
      declarations += variable;
    }
  }

  return declarations;
}

String getVariablesFromJson(List<VariableInfo> variables) {
  String declarations = '\n';

  for (VariableInfo variableInfo in variables) {
    if (variableInfo.basic) {
      String variable =
          '${variableInfo.name} = json[\'${variableInfo.identifier}\'];\n';
      declarations += variable;
    } else if (variableInfo.map) {
      if (variableInfo.primitive || variableInfo.dynamic) {
        String variable =
            '${variableInfo.name} = getMapOf${variableInfo.typeForImplement()}(json, \'${variableInfo.identifier}\');\n';
        declarations += variable;
      } else {
        String variable =
            '${variableInfo.name} = getMapOfInstances(json, \'${variableInfo.identifier}\');\n';
        declarations += variable;
      }
    } else if (variableInfo.list) {
      if (variableInfo.primitive) {
        String variable =
            '${variableInfo.name} = getListOf${variableInfo.typeForImplement()}(json, \'${variableInfo.identifier}\');\n';
        declarations += variable;
      } else {
        String variable =
            '${variableInfo.name} = getListOfInstances(json, \'${variableInfo.identifier}\');\n';
        declarations += variable;
      }
    } else if (variableInfo.date) {
      String variable =
          '${variableInfo.name} = getDatetime(json, \'${variableInfo.identifier}\');\n';
      declarations += variable;
    } else if (variableInfo.dynamic) {
      String variable =
          '${variableInfo.name} = getRequiredDynamic(json, \'${variableInfo.identifier}\');\n';
      declarations += variable;
    } else if (!variableInfo.primitive) {
      if (variableInfo.nullable) {
        String variable =
            '${variableInfo.name} = getInstanceOf(json, \'${variableInfo.identifier}\' ${variableInfo.recycle ? ', recyclerInstance: ${variableInfo.name}' : ''});\n';
        declarations += variable;
      } else {
        String variable =
            '${variableInfo.name} = getRequiredInstanceOf(json, \'${variableInfo.identifier}\' ${variableInfo.recycle ? ', recyclerInstance: ${variableInfo.name}' : ''});\n';
        declarations += variable;
      }
    } else if (variableInfo.nullable) {
      String variable =
          '${variableInfo.name} = get${variableInfo.typeForImplement()}Field(json, \'${variableInfo.identifier}\');\n';
      declarations += variable;
    } else {
      String variable =
          '${variableInfo.name} = getRequired${variableInfo.typeForImplement()}Field(json, \'${variableInfo.identifier}\'${variableInfo.defaultValue.isNotEmpty ? ', defaultValue: ${variableInfo.defaultValue}' : ''});\n';
      declarations += variable;
    }
  }

  return declarations;
}

String getParametersConstructor(List<VariableInfo> variables) {
  String declarations = '\n';

  for (VariableInfo variableInfo in variables) {
    declarations += 'required ${variableInfo.type} ${variableInfo.name},\n';
  }

  return declarations;
}

String getVariablesConstructor(List<VariableInfo> variables) {
  String declarations = '\n';

  for (VariableInfo variableInfo in variables) {
    declarations += 'this.${variableInfo.name} = ${variableInfo.name};\n';
  }

  return declarations;
}

String getParametersConstructorOptional(List<VariableInfo> variables) {
  String declarations = '\n';

  for (VariableInfo variableInfo in variables) {
    declarations += '${variableInfo.type}${variableInfo.nullable ? '' : '?'} ${variableInfo.name},\n';
  }

  return declarations;
}

String getVariablesConstructorOptional(List<VariableInfo> variables) {
  String declarations = '\n';

  for (VariableInfo variableInfo in variables) {
    declarations += 'this.${variableInfo.name} = ${variableInfo.name} ?? this.${variableInfo.name};\n';
  }

  return declarations;
}

String getPrimaryDeclaration(List<VariableInfo> variables) {
  for (VariableInfo variableInfo in variables) {
    if (variableInfo.primary) {
      return '''
  @override
  String getId() => ${variableInfo.name};
''';
    }
  }

  return '''
  @override
  String getId() {
    return '';
  }
''';
}
