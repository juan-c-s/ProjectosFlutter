import 'package:flutter/material.dart';

class PurchaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Purchase'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('300'),
            ),
          ],
        ),
      ),
    );
  }
}
