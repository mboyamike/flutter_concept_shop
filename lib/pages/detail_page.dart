import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_concept_shop/models/product.dart';
import 'package:flutter_concept_shop/constants.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments["product"];
    final Size screenSize = MediaQuery.of(context).size;

    var relativeLuminance = product.color.computeLuminance();

    const double kThreshold = 0.15;
    Color appBarIconColor;
    Brightness brightness;

    if ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) > kThreshold) {
      brightness = Brightness.light;
      appBarIconColor = Colors.black;
    } else {
      brightness = Brightness.dark;
      appBarIconColor = Colors.white;
    }

    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        brightness: brightness,
        iconTheme: IconThemeData(
          color: appBarIconColor,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: Colors.white,
              ),
              height: screenSize.height * 2 / 3,
              width: screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "About the ${product.name}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    product.description,
                    style: TextStyle(
                      letterSpacing: 0.7,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      color: product.color,
                      onPressed: () {},
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: appBarIconColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: defaultPadding,
            child: Container(
              height: screenSize.height / 2.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      product.name,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: appBarIconColor,
                          ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "ksh",
                    style: TextStyle(color: appBarIconColor),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      product.price.toStringAsFixed(2),
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: appBarIconColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: defaultPadding,
            top: screenSize.height / 24,
            child: Container(
              height: 160,
              width: 200,
              child: Hero(
                child: Image.asset(product.imagePath),
                tag: product.name,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
