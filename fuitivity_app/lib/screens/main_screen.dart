import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuitivityapp/complementation/cart_products.dart';
import 'package:fuitivityapp/complementation/constants.dart';
import 'package:fuitivityapp/complementation/reusable-card.dart';
import 'package:fuitivityapp/screens/chat_screen.dart';
import 'package:fuitivityapp/screens/purchase_screen.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fuitivityapp/complementation/products.dart';
import 'package:fuitivityapp/screens/cart.dart';

FirebaseUser loggedInUser;

class MainScreen extends StatefulWidget {
  static const String id = "mainScreen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _auth = FirebaseAuth.instance;

  String precioBanano = '1000';
  String precioLechuga = '300';
  String precioManzana = '630';
  String precioAguacate = '500';
  int cantidadManzana = 0;
  int cantidadAguacate = 0;
  int cantidadLechuga = 0;
  int cantidadBanano = 0;
  String fruitName;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/farmer.jpg'),
          AssetImage('images/farmer1.jpg'),
          AssetImage('images/Banano.jpg'),
          AssetImage('images/Aguacate.jpg'),
          AssetImage('images/Lechuga.jpg'),
          AssetImage('images/Manzana.jpg'),
        ],
        autoplay: false,
        dotSize: 5.0,
        indicatorBgPadding: 2,
        dotBgColor: Colors.transparent,
        //   animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xFFF1EDE1),
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.teal,
        title: Text(
          'Frutivity',
          style: kTitleTextStyle,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, Cart.id);
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('User'),
                accountEmail: Text(loggedInUser.email),
                currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                )),
                decoration: BoxDecoration(
                  color: Colors.teal,
                )),
            //body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Color(0xFFF6BF3E)),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Mi perfil'),
                leading: Icon(Icons.person, color: Color(0xFFF6BF3E)),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Mis pedidos'),
                leading: Icon(Icons.shopping_basket, color: Color(0xFFF6BF3E)),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Cart.id);
              },
              child: ListTile(
                title: Text('Mi carrito'),
                leading: Icon(Icons.shopping_cart, color: Color(0xFFF6BF3E)),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favoritos'),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Sobre la empresa'),
                leading: Icon(Icons.help, color: Colors.blue),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Configuraciones'),
                leading: Icon(Icons.settings, color: Colors.blueGrey),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          image_carousel,
          Padding(
            padding: EdgeInsets.all(8),
            child: Text('Categorías'),
          ),
          Categories(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(
              'Productos recientes',
              style: TextStyle(
                fontFamily: 'Quesha',
                fontSize: 20,
              ),
            ),
          ),
          //gridView
          Container(
            color: Colors.white,
            height: 400,
            child: Products(),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text('Frutas'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text('Vegetales'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
