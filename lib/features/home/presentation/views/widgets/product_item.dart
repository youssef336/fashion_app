import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset(
              Assets.assetsImageFirstProduct,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            product.name,
            style: const TextStyle(color: Colors.white),
            maxLines: 1,
          ),
          Text(
            product.description,
            style: const TextStyle(color: Colors.grey),

            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            product.price.toString(),
            style: const TextStyle(color: Color(0xffDD8560)),
          ),
        ],
      ),
    );
  }
}
