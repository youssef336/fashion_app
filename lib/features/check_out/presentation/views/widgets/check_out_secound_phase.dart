import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/core/helper_functions/build_error_bar.dart';
import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/utils/text_styles.dart';
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
import 'package:flutter_svg/flutter_svg.dart';

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

void showPaymentSuccess(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        'Payment Successful!'.toUpperCase(),
        style: TextStyles.tenor_Large_14.copyWith(
          fontSize: 17,
          color: Colors.black,
          letterSpacing: 2,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 25),
          SvgPicture.asset(Assets.assetsImageTrueImage),
          const SizedBox(height: 25),
          Text(
            "Your payment was success".toUpperCase(),
            style: TextStyles.tenor_Large_14.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            "Payment ID 15263541".toUpperCase(),
            style: TextStyles.tenor_Large_14.copyWith(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          SvgPicture.asset(
            Assets.assetsImageDivider,
            color: const Color(0xff555555),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 50,
              decoration: const BoxDecoration(color: Colors.black),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss dialog
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 140,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent, // no fill
                border: Border.all(color: Colors.grey), // grey outline
                borderRadius: BorderRadius.circular(
                  8,
                ), // optional rounded corners
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Dismiss dialog
                  // Dismiss dialog
                },
                child: const Text(
                  'Back to home',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
