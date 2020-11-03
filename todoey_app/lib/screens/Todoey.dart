import 'package:flutter/material.dart';
import 'package:todoeyapp/screens/addtask_screen.dart';
import '../widgets/task_list.dart';
import 'package:todoeyapp/const.dart';
import 'package:todoeyapp/models/Task.dart';

import 'package:provider/provider.dart';
import 'package:todoeyapp/models/global-task.dart';

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      child: AddTaskScreen(),
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom))));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.list, size: 30),
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Todoey',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    )),
                Text('${Provider.of<GlobalTask>(context).lengthOfList} tasks'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: kBoxDecorationContainer,
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
