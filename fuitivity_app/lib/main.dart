import 'package:flutter/material.dart';
import 'package:fuitivityapp/screens/product_details.dart';
import 'screens/main_screen.dart';
import 'screens/login_screen.dart';
import 'screens/main_screen.dart';
import 'screens/purchase_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        MainScreen.id: (context) => MainScreen(),
        ProductDetails.id: (context) => ProductDetails(),
        Cart.id: (context) => Cart(),
      },
    );
  }
}
