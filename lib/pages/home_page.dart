import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_concept_shop/widgets/product_tile.dart';
import 'package:flutter_concept_shop/models/product.dart';
import 'package:flutter_concept_shop/constants.dart';
import 'detail_page.dart';

class MyHomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      description: sampleDescription,
      name: "Nike",
      id: "Nike-Purple",
      imagePath: "assets/images/Purple Nike Shoes.png",
      color: Colors.purple,
      price: 4800,
    ),
    Product(
      description: sampleDescription,
      name: "Asics Running Shoes",
      id: "Asics",
      imagePath: "assets/images/Grey Asics Shoes.png",
      color: Colors.grey,
      price: 5000,
    ),
    Product(
      description: sampleDescription,
      name: "Nike 2",
      id: "Nike-Purple",
      imagePath: "assets/images/Nike Shoes.png",
      color: Colors.white,
      price: 6000,
    ),
    Product(
      description: sampleDescription,
      name: "Adidas",
      id: "Adidas",
      imagePath: "assets/images/Red Adidas.png",
      color: Colors.red,
      price: 2500,
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
            mainAxisSpacing: defaultPadding,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            String tag = "shoe-$index";

            return FlatButton(
              padding: EdgeInsets.zero,
              splashColor: products[index].color.withOpacity(0.4),
              onPressed: () {
                Get.to(DetailPage(), arguments: {
                  "product": products[index],
                  "tag": tag,
                });
              },
              child: ProductTile(product: products[index]),
            );
          },
        ),
      ),
    );
  }
}
