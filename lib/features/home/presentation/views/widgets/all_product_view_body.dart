import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class AllProductViewBody extends StatelessWidget {
  final List<ProductEntity> productList;
  const AllProductViewBody({super.key, required this.productList});

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
      itemBuilder: (context, index) => ProductItem(product: productList[index]),
      itemCount: productList.length,
    );
  }
}
