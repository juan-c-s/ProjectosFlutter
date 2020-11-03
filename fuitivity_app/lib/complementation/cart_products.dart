import 'package:fuitivityapp/complementation/constants.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnCart = [
    {
      "name": "Aguacate",
      "picture": 'images/Aguacate.jpg',
      "price": 500,
      "quantity": 1,
      "details":
          'El aguacate Hass o palta Hass son los nombres comunes del fruto de Persea americana pertenecientes a la variedad "Hass", originada a partir de una semilla de raza guatemalteca en un huerto de Rudolph Hass en la Habra, California en 1926, patentada en 1935 e introducida globalmente en el mercado en 1960; es la variedad más cultivada a nivel mundial.',
    },
    {
      "name": "Banano",
      "picture": 'images/Banano.jpg',
      "price": 300,
      "quantity": 1,
      "details": 'Bananos frescas cultivados en el suroeste Antioqueño.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsOnCart.length,
      itemBuilder: (context, index) {
        return SingleCartProduct(
          cartProductName: productsOnCart[index]["name"],
          cartProductPicture: productsOnCart[index]["picture"],
          cartProductPrice: productsOnCart[index]["price"],
          cartProductQuantity: productsOnCart[index]["quantity"],
        );
      },
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  SingleCartProduct(
      {this.cartProductName,
      this.cartProductPicture,
      this.cartProductPrice,
      this.cartProductQuantity});
  final cartProductName;
  final cartProductPrice;
  final cartProductPicture;
  final cartProductQuantity;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          margin: EdgeInsets.all(5),
          width: 350,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              //LEADING SECTION
              leading: Image.asset(
                cartProductPicture,
                width: 100,
                height: 100,
              ),
              title: Text(cartProductName),
              subtitle: Column(
                children: <Widget>[
                  //ROW INSIDE COLUMN
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          '\$$cartProductPrice',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_drop_up,
              ),
              padding: EdgeInsets.all(0),
              onPressed: () {},
            ),
            Text(
              cartProductQuantity.toString(),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down,
              ),
              padding: EdgeInsets.all(0),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
