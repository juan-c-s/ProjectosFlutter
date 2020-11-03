import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:todoeyapp/models/Task.dart';

import 'package:todoeyapp/models/global-task.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  String dismissibleWidget = "dismissibleWidget";
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalTask>(
      builder: (context, globalTask, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = globalTask.tasks[index];
            return TaskTile(
              isChecked: task.isCheckedBoxed,
              taskName: task.taskTitle,
              checkBoxCallBack: (checkBoxState) {
                globalTask.updateTask(task);
              },
              deleteTask: () {
                globalTask.deleteTask(globalTask.tasks[index]);
              },
            );
          },
          itemCount: globalTask.lengthOfList,
        );
      },
    );
  }
}
