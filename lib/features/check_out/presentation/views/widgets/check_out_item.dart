import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/core/utils/text_styles.dart';
import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/amount.dart';
import 'package:flutter/material.dart';

class CheckOutItem extends StatelessWidget {
  const CheckOutItem({super.key, required this.product, required this.counter});
  final ValueNotifier<int> counter;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(height: 160, child: Image.network(product.image!)),
            const SizedBox(width: 14),
            SizedBox(
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name.toUpperCase(),
                    style: TextStyles.price_Large_18.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description.toUpperCase(),
                    style: TextStyles.bodyL_Large_16.copyWith(
                      fontSize: 14,
                      color: const Color(0xff555555),
                    ),
                  ),
                  const SizedBox(height: 10),
                  amount(counter: counter),
                  const SizedBox(height: 15),
                  Text(
                    "\$${product.price.toString()}",
                    style: TextStyles.price_Large_18.copyWith(
                      color: const Color(0xffDD8560),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ignore: camel_case_types
