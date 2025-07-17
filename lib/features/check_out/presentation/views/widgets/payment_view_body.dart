import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/header.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/payment_text_fieild.dart';
import 'package:flutter/material.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.45;

    return SingleChildScrollView(child: PaymentTextFieild(width: width));
  }
}
