import 'package:flutter/cupertino.dart';

class Tasks {
  bool isCheckedBoxed;
  String taskTitle;
  Tasks({this.isCheckedBoxed = false, this.taskTitle});

  void changeState() {
    isCheckedBoxed = !isCheckedBoxed;
  }
}
