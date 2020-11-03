import 'package:flutter/material.dart';
import 'package:todoeyapp/widgets/tasks_tile.dart';

import 'Task.dart';
import 'dart:collection';

class GlobalTask extends ChangeNotifier {
  List<Tasks> _tasks = [
    Tasks(taskTitle: 'Buy Eggs'),
    Tasks(taskTitle: 'Buy ham'),
    Tasks(taskTitle: 'Buy milk'),
  ];
  UnmodifiableListView<Tasks> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTask) {
    _tasks.add(Tasks(taskTitle: newTask));
    notifyListeners();
  }

  int get lengthOfList {
    return _tasks.length;
  }

  void updateTask(Tasks task) {
    task.changeState();
    notifyListeners();
  }

  void deleteTask(Tasks task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
