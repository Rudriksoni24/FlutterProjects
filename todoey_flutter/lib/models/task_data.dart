import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  void addData(String name, bool isDone) {
    _tasks.add(
      Task(name: name, isDone: isDone),
    );
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  Task getTaskData(int index) {
    return _tasks[index];
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
