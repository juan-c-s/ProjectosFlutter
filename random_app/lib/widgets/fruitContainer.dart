import 'package:flutter/material.dart';
import 'package:random_app/productData.dart';
import 'package:provider/provider.dart';

class FruitContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: DataProvider().productData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Consumer<DataProvider>(
          builder: (context, dataProvider, child) {
            return Fruit(
              picture: dataProvider.productData[index]["picture"],
              name: dataProvider.productData[index]["name"],
              addToCart: () {
                dataProvider.addToCart(dataProvider.productData[index]);
              },
            );
          },
        );
      },
    );
  }
}

class Fruit extends StatelessWidget {
  Fruit(
      {this.name,
      this.picture,
      this.details,
      this.quantity,
      this.price,
      this.addToCart});
  final name;
  final picture;
  final details;
  final quantity;
  final price;
  final addToCart;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridTile(
            child: Image.asset(
              picture,
              fit: BoxFit.cover,
            ),
            footer: Container(
              color: Colors.white70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: addToCart,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
