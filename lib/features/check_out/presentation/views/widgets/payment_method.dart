import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/utils/text_styles.dart';
import 'package:fashion/features/check_out/domain/entities/card_entity.dart';
import 'package:fashion/features/check_out/presentation/views/payment_view.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_secound_phase_item.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({
    super.key,
    this.paymentMethod = false,
    required this.cardNotifer,
  });
  final bool paymentMethod;
  final ValueNotifier<CardEntity?> cardNotifer;
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CardEntity?>(
      valueListenable: widget.cardNotifer,
      builder: (context, card, _) {
        return card == null || (card.cardNumber?.isEmpty ?? true)
            ? CheckOutSecoundPhaseItem(
                title: "Payment method",
                SubTitle: "Visa payment method",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PaymentView.routeName,
                    arguments: widget.cardNotifer,
                  );
                },
              )
            : SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(color: Colors.grey, height: 1, thickness: 1),

                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Image.asset(Assets.assetsImageMasterCard, height: 35),
                          const SizedBox(width: 12),
                          Text(
                            "Master Card ending",
                            style: TextStyles.price_Large_18.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "....",
                            style: TextStyles.price_Large_18.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),

                          Text(
                            (card.cardNumber != null &&
                                    card.cardNumber!.length >= 4)
                                ? card.cardNumber!.substring(
                                    card.cardNumber!.length - 4,
                                  )
                                : card.cardNumber ?? "",
                            style: TextStyles.price_Large_18.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),

                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                PaymentView.routeName,
                                arguments: widget.cardNotifer,
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Divider(color: Colors.grey, height: 1, thickness: 1),
                  ],
                ),
              );
      },
    );
  }
}
