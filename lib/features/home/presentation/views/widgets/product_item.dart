// ignore_for_file: unused_import

import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/utils/text_styles.dart';
import 'package:fashion/features/check_out/presentation/views/check_out_view.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          CheckOutView.routeName,
          arguments: product,
        );
      },
      child: SizedBox(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Hero(
                tag: product.name, // or product.name if unique
                child: Material(
                  color: Colors.transparent,
                  child: Image.network(
                    product.image ?? "https://fallback-image-url.com",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Text(
              product.name,
              style: TextStyles.bodyL_Small_16.copyWith(color: Colors.white),
              maxLines: 1,
            ),
            Text(
              product.description,
              style: TextStyles.bodyL_Small_16.copyWith(
                fontSize: 15,
                color: Colors.grey,
              ),

              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "\$${product.price.toString()}",
              style: TextStyles.price_Small_18.copyWith(
                fontSize: 15,
                color: const Color(0xffDD8560),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
