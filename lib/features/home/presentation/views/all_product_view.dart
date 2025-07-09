import 'package:fashion/features/home/presentation/views/widgets/all_product_view_body.dart';
import 'package:flutter/material.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({super.key});
  static const String routeName = "AllProductView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(child: AllProductViewBody()),
    );
  }
}
