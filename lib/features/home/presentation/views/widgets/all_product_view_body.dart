import 'package:fashion/features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class AllProductViewBody extends StatelessWidget {
  const AllProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 20,
        crossAxisSpacing: 15,
        mainAxisExtent: 300,
      ),
      itemBuilder: (context, index) => const ProductItem(),
      itemCount: 10,
    );
  }
}
