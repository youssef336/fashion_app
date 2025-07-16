import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_first_phase.dart';
import 'package:flutter/material.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final pages = [
      CheckOutFirstPhase(product: product),
      // Add more phases here if needed
    ];

    return PageView.builder(
      itemBuilder: (context, index) => pages[index],
      itemCount: pages.length,
    );
  }
}
