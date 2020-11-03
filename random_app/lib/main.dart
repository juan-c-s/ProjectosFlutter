import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_app/productData.dart';
import 'main-page.dart';
import 'cart-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(initialRoute: '/', routes: {
        '/': (context) => MainPage(),
        'cartPage': (context) => CartPage(),
      }),
    );
  }
}
