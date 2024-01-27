import 'dart:io';

import '../../builders/get_metadata.dart';
import '../../builders/object_builder.dart';
import '../../utils/configuration.dart';
import '../base/base_task.dart';

const baseProject = 'lib';

class GenerateObjectTask extends BaseTask {
  @override
  Future<void> work() async {
    var appId = loadId();
    var config = loadConfigFile();

    final baseProjectFolder = config['baseProjectFolder'] ?? baseProject;
    final dir = Directory('./$baseProjectFolder');
    await dir.create(recursive: true);

    final generationClassSuffix = config['generationClassSuffix'] ?? 'Gen';

    final outputFolder =
        baseProjectFolder + '/' + (config['outputFolder'] ?? '');

    final outputFolderDir = Directory('./$outputFolder');
    await outputFolderDir.create(recursive: true);

    final modelsFile = config['modelsFile'] ?? 'model.g.dart';

    final String outputFile = outputFolder + '/' + modelsFile;

    final List<FileSystemEntity> entities =
        await dir.list(recursive: true).toList();

    final files = <FileSystemEntity>[];

    for (FileSystemEntity fileSystemEntity in entities) {
      try {
        if (fileSystemEntity is Directory) continue;
        if (fileSystemEntity.path.endsWith('.DS_Store')) continue;

        final File file = File(fileSystemEntity.path);

        if (file.path.contains(modelsFile)) continue;

        final content = await file.readAsString();
        if (content.contains('@Field(')) {
          files.add(fileSystemEntity);
        }
      } catch (e) {
        print(e);
      }
    }

    String imports = '''
import 'package:object/object.dart';\n
export 'package:object/object.dart';\n
    ''';
    String mainGeneratedContent = '';
    for (FileSystemEntity fileSystemEntity in files) {
      final File file = File(fileSystemEntity.path);

      var p = file.path.split(baseProjectFolder)[1];
      var classImport = 'package:$appId$p';

      print(classImport);

      var className = await findClassName(file.path);
      if (className == null) continue;
      print(className);

      var variables = await findVariables(file.path);
      if (variables.isEmpty) continue;

      imports += '''
import '$classImport';
''';
      for (final variables in variables) {
        if (variables.additionalImport.isNotEmpty) {
          imports += '''
import '${variables.additionalImport}';
''';
        }
      }
      mainGeneratedContent +=
          getObjectClassFor(className, generationClassSuffix, variables);
    }

    final File file = File(outputFile);
    await file.writeAsString('''
$imports

$mainGeneratedContent
''');
  }
}
