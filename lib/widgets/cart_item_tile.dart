import 'package:flutter/material.dart';
import 'package:flutter_concept_shop/models/cart_item.dart';
import 'package:flutter_concept_shop/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartItemTile extends StatefulWidget {
  final CartItem item;

  CartItemTile(this.item);

  @override
  _CartItemTileState createState() => _CartItemTileState(item);
}

class _CartItemTileState extends State<CartItemTile> {
  CartItem item;
  _CartItemTileState(this.item);
  CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          height: 150,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: _showPictureDialog,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: item.product.color,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(item.product.imagePath),
                  ),
                ),
                flex: 3,
              ),
              Spacer(flex: 1,),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.product.name,
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "Ksh",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w100,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      "${item.totalPrice}",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                flex: 3,
              ),
              Spacer(
                flex: 1,
              ),
              Flexible(
                child: FlatButton(
                  minWidth: 25,
                  padding: EdgeInsets.zero,
                  onPressed: decrement,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 16,
                  ),
                  color: Colors.red,
                  shape: CircleBorder(),
                ),
                flex: 1,
              ),
              Flexible(
                child: Text(
                  item.amount.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                flex: 1,
              ),
              Flexible(
                child: FlatButton(
                  minWidth: 25,
                  padding: EdgeInsets.zero,
                  onPressed: increment,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                  color: Colors.green,
                  shape: CircleBorder(),
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPictureDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
        backgroundColor: item.product.color,
        content: Image.asset(item.product.imagePath),
      ),
    );
  }

  void increment() {
    setState(() {
      item.amount++;
    });
  }

  void decrement() {
    if (item.amount > 1)
      setState(() {
        item.amount--;
      });
  }
}
