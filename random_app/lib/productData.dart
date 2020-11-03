import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataProvider extends ChangeNotifier {
  List<dynamic> productData = productList;
  List<dynamic> cart = [];
  bool isRepeated;
  void addToCart(product) {
    for (var singleProduct in cart) {
      if (product == singleProduct) {
        isRepeated = true;
      }
    }
    if (isRepeated != true) {
      cart.add(product);
    }

    notifyListeners();
  }
}

var productList = [
  {
    "name": "Aguacate",
    "picture": 'images/Aguacate.jpg',
    "price": 500,
    "details":
        'El aguacate Hass o palta Hass son los nombres comunes del fruto de Persea americana pertenecientes a la variedad "Hass", originada a partir de una semilla de raza guatemalteca en un huerto de Rudolph Hass en la Habra, California en 1926, patentada en 1935 e introducida globalmente en el mercado en 1960; es la variedad más cultivada a nivel mundial.',
    "quantity": 1,
  },
  {
    "name": "Banano",
    "picture": 'images/Banano.jpg',
    "price": 300,
    "details": 'Bananos frescas cultivados en el suroeste Antioqueño.',
    "quantity": 1,
  },
  {
    "name": "Lechuga",
    "picture": 'images/Lechuga.jpg',
    "price": 450,
    "details": 'Lechugas frescas cultivadas en Rionegro.',
    "quantity": 1,
  },
  {
    "name": "Manzana",
    "picture": 'images/Manzana.jpg',
    "price": 450,
    "details": 'Manzanas frescas cultivadas en Rionegro.',
    "quantity": 1,
  },
];
