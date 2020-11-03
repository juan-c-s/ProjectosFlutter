import 'package:flutter/material.dart';
import 'package:fuitivityapp/screens/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Aguacate",
      "picture": 'images/Aguacate.jpg',
      "price": 500,
      "details":
          'El aguacate Hass o palta Hass son los nombres comunes del fruto de Persea americana pertenecientes a la variedad "Hass", originada a partir de una semilla de raza guatemalteca en un huerto de Rudolph Hass en la Habra, California en 1926, patentada en 1935 e introducida globalmente en el mercado en 1960; es la variedad más cultivada a nivel mundial.',
    },
    {
      "name": "Banano",
      "picture": 'images/Banano.jpg',
      "price": 300,
      "details": 'Bananos frescas cultivados en el suroeste Antioqueño.',
    },
    {
      "name": "Lechuga",
      "picture": 'images/Lechuga.jpg',
      "price": 450,
      "details": 'Lechugas frescas cultivadas en Rionegro.',
    },
    {
      "name": "Manzana",
      "picture": 'images/Manzana.jpg',
      "price": 450,
      "details": 'Manzanas frescas cultivadas en Rionegro.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          productName: productList[index]['name'],
          productPicture: productList[index]['picture'],
          productPrice: productList[index]['price'],
          productDetails: productList[index]['details'],
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  SingleProduct(
      {this.productName,
      this.productPicture,
      this.productPrice,
      @required this.productDetails});
  final productName;
  final productPicture;
  final productPrice;
  final productDetails;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: productName,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                        productDetailPrice: productPrice,
                        productDetailPicture: productPicture,
                        productDetailName: productName,
                        productDetailInfo: productDetails,
                      ))),
              child: GridTile(
                footer: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          productName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '$productPrice',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                child: Image.asset(
                  productPicture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}
