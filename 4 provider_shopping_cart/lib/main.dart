import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopping_cart/cart_model.dart';

import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<CartModel>(
        create: (_) => CartModel(),
        child: MyHomePage(title: 'Gift Shop'),
      ),
    );
  }
}
