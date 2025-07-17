import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/core/widgets/custom_text_feild.dart';
import 'package:fashion/features/check_out/domain/entities/address_entity.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_buttom.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentTextFieild extends StatefulWidget {
  const PaymentTextFieild({super.key, required this.width});

  final double width;

  @override
  State<PaymentTextFieild> createState() => _PaymentTextFieildState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

class _PaymentTextFieildState extends State<PaymentTextFieild> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomAppBar(isblack: false),
                const SizedBox(height: 34),
                const Header(text: "Add shipping adress"),
                const SizedBox(height: 20),
                CreditCardWidget(
                  cardBgColor: Colors.black,
                  cardNumber: "1234 5678 9012 3456",
                  expiryDate: "01/24",
                  cardHolderName: "John Doe",
                  cvvCode: "123",
                  showBackView: false,
                  onCreditCardWidgetChange: (p0) {},
                ),
                const SizedBox(height: 20),
                CustomTextFormFeild(
                  hintText: "Name On Card",
                  textInputType: TextInputType.name,
                  onSaved: (p0) {},
                ),

                const SizedBox(height: 20),
                CustomTextFormFeild(
                  maxLines: 1,
                  textInputType: TextInputType.number,
                  hintText: "Card Number",
                  onSaved: (p0) {},
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    SizedBox(
                      width: widget.width,
                      child: CustomTextFormFeild(
                        maxLines: 1,
                        textInputType: TextInputType.number,
                        hintText: "Exp Month",
                        onSaved: (p0) {},
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: widget.width,
                      child: CustomTextFormFeild(
                        maxLines: 1,
                        textInputType: TextInputType.number,
                        hintText: "Exp Date",
                        onSaved: (p0) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextFormFeild(
                  maxLines: 1,
                  textInputType: TextInputType.number,
                  hintText: "CVV",
                  onSaved: (p0) {},
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.179),
          CheckOutButtom(
            text: "add now",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                Navigator.pop(context);
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
