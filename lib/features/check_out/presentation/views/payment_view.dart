import 'package:fashion/features/check_out/presentation/views/widgets/payment_view_body.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});
  static const String routeName = '/payment';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: PaymentViewBody());
  }
}
