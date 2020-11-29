import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_concept_shop/models/cart_item.dart';
import 'package:flutter_concept_shop/models/product.dart';
import 'package:flutter_concept_shop/widgets/cart_item_tile.dart';
import 'package:get/get.dart';
import 'package:flutter_concept_shop/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      home: CartItemTile(
        CartItem(
          product: Product(
            id: "1",
            imagePath: "assets/images/Red Adidas.png",
            name: "Red Adidas",
            description: "These are the best shoes South of the border",
            price: 3500,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
