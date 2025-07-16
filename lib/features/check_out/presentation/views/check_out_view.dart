import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_view_body.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.product});
  static const String routeName = '/check-out';
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CheckOutViewBody(product: product));
  }
}
