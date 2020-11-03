import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.red,
                  height: 100,
                  child: Text(
                    'Nice Job!',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Colors.green,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      color: Colors.yellow,
                      height: 100,
                      width: 100,
                    )
                  ]),
              Expanded(
                  child: Container(
                color: Colors.blue,
                height: 100,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
