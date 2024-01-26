import 'tasks/main_task.dart';
import 'utils/configuration.dart';

void main(List<String> arguments) async {
  var dependencies = loadDependenciesFile();
  print(introMessage(dependencies['object'].toString()));
  await MainTask().work();
}
