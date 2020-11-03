import 'package:flutter/material.dart';

//This main function is the starting point for all flutter apps
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.black54,
        ),
        body: Center(
          //Cuando vas a centrar una imagen tienes que ponerlo primero y depues un Child que ya contendrá el resto.
          child: Image(
            image: AssetImage('images/anonymous.webp'),
          ),
        ),
      ),
    ),
  );
}
