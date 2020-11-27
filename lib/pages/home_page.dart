import 'package:flutter/material.dart';
import 'package:flutter_concept_shop/widgets/product_tile.dart';
import 'package:flutter_concept_shop/models/product.dart';
import 'package:flutter_concept_shop/constants.dart';

class MyHomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Nike",
      id: "Nike-Purple",
      imagePath: "assets/images/Purple Nike Shoes.png",
      color: Colors.purple,
      price: 4800,
    ),
    Product(
      name: "Asics Running Shoes",
      id: "Asics",
      imagePath: "assets/images/Grey Asics Shoes.png",
      color: Colors.grey,
      price: 4800,
    ),
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
          color: Colors.deepOrange,
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
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: defaultPadding / 2,
            mainAxisSpacing: defaultPadding / 2,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return ProductTile(product: products[index]);
          },
        ),
      ),
    );
  }
}