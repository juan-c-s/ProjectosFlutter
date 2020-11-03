import 'package:flutter/material.dart';
import 'package:todoeyapp/models/global-task.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  @override
  final String taskName;
  final bool isChecked;
  final Function checkBoxCallBack;
  final Function deleteTask;
  TaskTile(
      {this.checkBoxCallBack, this.isChecked, this.taskName, this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteTask,
      title: Text(taskName,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
