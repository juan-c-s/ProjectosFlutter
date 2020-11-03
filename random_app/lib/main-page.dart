import 'package:flutter/material.dart';
import 'package:random_app/widgets/fruitContainer.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF1EDE1),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Frutivity'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, 'cartPage');
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: FruitContainer(),
              height: 600,
            ),
          ],
        ));
  }
}
