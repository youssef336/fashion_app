import 'package:fashion/features/check_out/domain/entities/card_entity.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/payment_view_body.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.cardNotifer});
  static const String routeName = '/payment';
  final ValueNotifier<CardEntity?> cardNotifer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PaymentViewBody(cardNotifer: cardNotifer));
  }
}
