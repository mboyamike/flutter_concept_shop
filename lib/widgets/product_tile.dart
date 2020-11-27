import 'package:flutter/material.dart';
import 'package:flutter_concept_shop/models/product.dart';

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