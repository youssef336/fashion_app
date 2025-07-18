import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/features/check_out/domain/entities/card_entity.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_buttom.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentTextFieild extends StatefulWidget {
  const PaymentTextFieild({
    super.key,
    required this.width,
    required this.cardNotifer,
  });

  final double width;
  final ValueNotifier<CardEntity?> cardNotifer;

  @override
  State<PaymentTextFieild> createState() => _PaymentTextFieildState();
}

class _PaymentTextFieildState extends State<PaymentTextFieild> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomAppBar(isblack: false),
              const SizedBox(height: 34),
              const Header(text: "Add shipping adress"),
              const SizedBox(height: 20),
              ValueListenableBuilder<CardEntity?>(
                valueListenable: widget.cardNotifer,
                builder: (context, card, _) {
                  return CreditCardWidget(
                    cardBgColor: Colors.black,
                    cardNumber: card?.cardNumber ?? "",
                    expiryDate: card?.expiryDate ?? "",
                    cardType: CardType.mastercard,
                    cardHolderName: card?.cardHolderName ?? "",
                    cvvCode: card?.cvv ?? "",
                    showBackView:
                        (widget.cardNotifer.value?.cvv?.isNotEmpty ?? false) &&
                        (widget.cardNotifer.value?.cvv?.length != 3),

                    isHolderNameVisible: true,
                    onCreditCardWidgetChange: (_) {},
                  );
                },
              ),
              const SizedBox(height: 20),
              CreditCardForm(
                cardNumber: widget.cardNotifer.value?.cardNumber ?? "",
                expiryDate: widget.cardNotifer.value?.expiryDate ?? "",
                cardHolderName: widget.cardNotifer.value?.cardHolderName ?? "",
                cvvCode: widget.cardNotifer.value?.cvv ?? "",
                onCreditCardModelChange: onCreditCardModelChange,
                formKey: _formKey,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.179),
        CheckOutButtom(
          text: "add now",
          onTap: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.cardNotifer.value = widget.cardNotifer.value!.copyWith(
                cardHolderName: widget.cardNotifer.value!.cardHolderName,
                cardNumber: widget.cardNotifer.value!.cardNumber,
                expiryDate: widget.cardNotifer.value!.expiryDate,
                cvv: widget.cardNotifer.value!.cvv,
              );
              Navigator.pop(context);
            } else {
              setState(() {
                _autovalidateMode = AutovalidateMode.always;
              });
            }
          },
        ),
      ],
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    widget.cardNotifer.value = widget.cardNotifer.value!.copyWith(
      cardHolderName: data.cardHolderName,
      cardNumber: data.cardNumber,
      expiryDate: data.expiryDate,
      cvv: data.cvvCode,
    );
  }
}
