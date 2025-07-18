import 'package:flutter/widgets.dart';

class ProductEntity {
  String name;
  String description;
  double price;

  String? image;

  ProductEntity({
    required this.name,
    required this.description,
    required this.price,

    this.image,
  });
}
