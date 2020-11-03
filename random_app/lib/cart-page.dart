import 'package:flutter/material.dart';
import 'productData.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Consumer<DataProvider>(builder: (context, dataProvider, child) {
        return ListView.builder(
            itemCount: dataProvider.cart.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Material(
                    child: ListTile(
                      title: Text(dataProvider.cart[index]["name"]),
                    ),
                  ),
                ],
              );
            });
      }),
    );
  }
}
