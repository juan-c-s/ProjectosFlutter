import 'package:flutter/material.dart';
import 'package:todoeyapp/const.dart';
import 'package:todoeyapp/models/Task.dart';
import 'package:todoeyapp/widgets/task_list.dart';
import 'package:todoeyapp/screens/Todoey.dart';

import 'package:todoeyapp/models/global-task.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/screens/addtask_screen.dart';

class AddTaskScreen extends StatelessWidget {
  final Function taskScreenCallBack;
  AddTaskScreen({this.taskScreenCallBack});
  String task;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff757575),
        child: Container(
            padding: EdgeInsets.all(20),
            decoration: kBoxDecorationContainer,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('Add Task',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.lightBlueAccent,
                      )),
                  Container(
                    child: TextField(
                        onChanged: (newTask) {
                          task = newTask;
                        },
                        autofocus: true,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                        )))),
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                      child: Text('ADD'),
                      color: Colors.lightBlueAccent,
                      onPressed: () {
                        Provider.of<GlobalTask>(context, listen: false)
                            .addTask(task);
                        Navigator.pop(context);
                      }),
                ],
              ),
            )));
  }
}
