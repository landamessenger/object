import 'base/base_task.dart';
import 'tasks/format_task.dart';
import 'tasks/generate_objects_task.dart';

class MainTask extends BaseTask {
  final tasks = [
    GenerateObjectTask(),
    FormatTask(),
  ];

  @override
  Future<void> work() async {
    for (BaseTask task in tasks) {
      try {
        print('\n - Running ${task.runtimeType.toString()} \n');
        await task.work();
      } catch (e) {
        print(e);
      }
    }
    print('\n Object models generated \n');
  }
}
