import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';
import 'cart_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartModel>(context);
    int totalCount = 0;
    if (cartProvider.cartItems.length > 0) {
      totalCount = cartProvider.cartItems.values.reduce((a, b) => a + b);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
                height: 150.0,
                width: 30.0,
                child: new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ),
                    );
                  },
                  child: new Stack(
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      new Positioned(
                          child: new Stack(
                        children: <Widget>[
                          new Icon(Icons.brightness_1,
                              size: 20.0, color: Colors.red[700]),
                          new Positioned(
                              top: 3.0,
                              right: 7,
                              child: new Center(
                                child: new Text(
                                  '$totalCount',
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ],
                      )),
                    ],
                  ),
                )),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return GestureDetector(
              onTap: () {
                Provider.of<CartModel>(context, listen: false).addToCart(index);
              },
              child: Container(
                alignment: Alignment.bottomRight,
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/${index + 1}.jpg"),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ));
        }),
      ),
    );
  }
}
