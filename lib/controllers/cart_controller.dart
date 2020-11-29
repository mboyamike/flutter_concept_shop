import 'package:get/get.dart';
import 'package:flutter_concept_shop/models/cart_item.dart';

class CartController extends GetxController {
  Map<String, CartItem> items = {};

  double get totalPrice {
    double amount = 0;
    items.forEach((key, cartItem) {
      amount += cartItem.totalPrice;
    });

    return amount;
  }

  void addItem(CartItem item) {
    if(items.containsKey(item.product.name)) {
      items[item.product.name].amount += 1;
    } else {
      items[item.product.name] = item;
    }
    notifyChildrens();
  }

  void removeItem(CartItem item) {
    items.remove(item.product.name);
    notifyChildrens();
  }

  void setAmount(CartItem item) {
    items[item.product.name].amount = item.amount;
    notifyChildrens();
  }
}