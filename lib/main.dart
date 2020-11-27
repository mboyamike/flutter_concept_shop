import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_concept_shop/constants.dart';
import 'package:flutter_concept_shop/models/product.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
          textTheme: Theme.of(context).textTheme.copyWith(
                headline6: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.black,
                    ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Nike",
      id: "Nike-Purple",
      imagePath: "assets/images/Purple Nike Shoes.png",
      color: Colors.purple,
      price: 4800,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Concept Shop"),
        leading: Icon(
          Icons.shopping_basket_outlined,
          color: Color.fromRGBO(185, 150, 145, 1),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_outlined,
              color: Colors.black54,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black54,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: defaultPadding / 2,
            mainAxisSpacing: defaultPadding / 2,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return ProductTile(product: products[0]);
          },
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  product.color.withOpacity(0.5),
                  product.color,
                ],
                stops: [
                  0.2,
                  0.8,
                ]),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          width: 170,
          height: 160,
          padding: EdgeInsets.all(25),
          child: Center(
            child: Image.asset(
              product.imagePath,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          product.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text("Ksh ${product.price}"),
      ],
    );
  }
}
