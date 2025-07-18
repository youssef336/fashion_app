// ignore_for_file: must_be_immutable, non_constant_identifier_names, deprecated_member_use

import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/core/helper_functions/build_error_bar.dart';
import 'package:fashion/core/helper_functions/show_payment_success.dart';
import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/features/check_out/domain/entities/address_entity.dart';
import 'package:fashion/features/check_out/domain/entities/card_entity.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_buttom.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_first_phase.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_item.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/header.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/payment_method.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/shipping_adress.dart';
import 'package:flutter/material.dart';

class CheckOutSecoundPhase extends StatelessWidget {
  CheckOutSecoundPhase({
    super.key,
    this.onTap,
    required this.counter,
    required this.product,
  });
  final void Function()? onTap;
  final ValueNotifier<int> counter;
  final ProductEntity product;
  ValueNotifier<AddressEntity?> addressNotifier = ValueNotifier<AddressEntity?>(
    AddressEntity(),
  );
  ValueNotifier<CardEntity?> CardNotifier = ValueNotifier<CardEntity?>(
    CardEntity(),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.872,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomAppBar(isblack: false),
                const SizedBox(height: 34),
                const Header(text: "CheckOut"),
                const SizedBox(height: 20),
                ShippingAdress(addressNotifier: addressNotifier),
                const SizedBox(height: 20),
                PaymentMethod(cardNotifer: CardNotifier),
                const SizedBox(height: 20),
                ListenableBuilder(
                  listenable: CardNotifier,
                  builder: (context, child) {
                    return Visibility(
                      visible:
                          AddressEntity.NotEmpty(addressNotifier.value!) &&
                          CardEntity.NotEmpty(CardNotifier.value!),
                      child: CheckOutItem(product: product, counter: counter),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        TotalPrice(counter: counter, product: product),
        const SizedBox(height: 10),
        CheckOutButtom(
          text: "CheckOut",
          image: Assets.assetsImageShoppingbag,
          onTap: () {
            if (AddressEntity.NotEmpty(addressNotifier.value!) &&
                CardEntity.NotEmpty(CardNotifier.value!)) {
              showPaymentSuccess(context);
            } else {
              showErrorBar(context, "Please fill all the fields");
            }
          },
        ),
      ],
    );
  }
}
