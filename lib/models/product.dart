import 'package:flutter/material.dart';

class Product {
  String id = "product ID";
  String name = "product Name";
  String description = "product Description";
  double price;
  Color color = Colors.white;
  String imagePath;

  Product({
    this.id,
    this.name,
    this.description,
    this.price = 7750,
    this.color = Colors.white,
    @ required this.imagePath,
  });
}

String sampleDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse non aliquet tortor. Aenean fringilla tortor vitae mollis faucibus. Cras sollicitudin, turpis eu accumsan pharetra, quam turpis vulputate nisl, nec sagittis erat velit eget libero. Aenean eu nisi vitae purus congue molestie ut nec turpis. Nam semper ex quis justo tincidunt, et ornare ex consectetur. Nulla id dolor ac nisl vehicula placerat a sit amet nisl. Quisque ultricies lobortis turpis, sed euismod est porta id. Aenean nunc risus, lobortis ut tortor dignissim, tempor mattis augue. Phasellus justo sapien, facilisis nec convallis quis";