import 'package:flutter/material.dart';
import 'package:fuitivityapp/complementation/constants.dart';
import 'package:fuitivityapp/complementation/products.dart';
import 'package:fuitivityapp/screens/main_screen.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails(
      {this.productDetailName,
      this.productDetailPicture,
      this.productDetailPrice,
      this.productDetailInfo});
  final productDetailName;
  final productDetailPicture;
  final productDetailPrice;
  final productDetailInfo;
  static const id = 'ProductDetails';
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EDE1),
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.teal,
        title: InkWell(
          onTap: () {
            Navigator.pushNamed(context, MainScreen.id);
          },
          child: Text(
            'Frutivity',
            style: kTitleTextStyle,
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productDetailPicture),
              ),
              footer: Container(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.productDetailName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.lightGreen[200],
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          '\$' '${widget.productDetailPrice} por kilo',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //===firstButton===
          Row(children: <Widget>[
            Expanded(
                child: MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Cantidad'),
                        content: Text('Escoja Cantidad'),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cerrar'),
                          ),
                        ],
                      );
                    });
              },
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Cantidad'),
                  ),
                  Expanded(
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ))
          ]),

          //====secondButton====
          Row(children: <Widget>[
            Expanded(
                child: MaterialButton(
              padding: EdgeInsets.all(12),
              onPressed: () {},
              color: Colors.teal,
              textColor: Colors.white,
              elevation: 2.0,
              child: Text('Compra ya'),
            )),
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              color: Colors.teal,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              color: Colors.teal,
              onPressed: () {},
            ),
          ]),
          Divider(),
          ListTile(
            title: Padding(
                child: Text('Sobre el Producto'),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3)),
            subtitle: Text(
              '${widget.productDetailInfo}',
            ),
          ),
          Divider(),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 50, 5),
                child: Text('Producto'),
              ),
              Text(widget.productDetailName),
            ],
          ),
          ListTile(
            title: Text('Información'),
            subtitle: Text(
                'Todos los productos que vende esta marca vienen directamente de los agricultores'),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Similar Products'),
          ),
          Container(
            height: 360,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var productList = [
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
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SimilarSingleProduct(
          productName: productList[index]['name'],
          productPicture: productList[index]['picture'],
          productPrice: productList[index]['price'],
          productDetails: productList[index]['details'],
        );
      },
    );
  }
}

class SimilarSingleProduct extends StatelessWidget {
  SimilarSingleProduct(
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
