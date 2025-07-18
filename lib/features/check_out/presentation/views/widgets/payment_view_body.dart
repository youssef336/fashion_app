import 'package:fashion/features/check_out/domain/entities/card_entity.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/payment_text_fieild.dart';
import 'package:flutter/material.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key, required this.cardNotifer});
  final ValueNotifier<CardEntity?> cardNotifer;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.45;

    return SingleChildScrollView(
      child: PaymentTextFieild(cardNotifer: cardNotifer, width: width),
    );
  }
}
