import 'package:flutter/material.dart';

class Product {
  String id;
  String name;
  String description;
  double price;
  Color color;
  String imagePath;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.color = Colors.white,
    this.imagePath,
  });
}
