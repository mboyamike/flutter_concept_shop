import 'package:flutter/cupertino.dart';
import 'package:flutter_concept_shop/models/product.dart';

class CartItem {
  Product product;
  int amount;

  CartItem({
    @required this.product,
    this.amount = 1
  });

  double get totalPrice => product.price * amount;

}