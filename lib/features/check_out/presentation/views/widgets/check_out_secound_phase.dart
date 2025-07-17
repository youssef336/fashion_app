import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/utils/text_styles.dart';
import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/features/check_out/domain/entities/address_entity.dart';
import 'package:fashion/features/check_out/presentation/views/address_view.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_buttom.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_first_phase.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_secound_phase_item.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/header.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/payment_method.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/shipping_adress.dart';
import 'package:flutter/material.dart';

class CheckOutSecoundPhase extends StatelessWidget {
  const CheckOutSecoundPhase({
    super.key,
    this.onTap,
    required this.counter,
    required this.product,
  });
  final void Function()? onTap;
  final ValueNotifier<int> counter;
  final ProductEntity product;

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
                const ShippingAdress(),
                const SizedBox(height: 20),
                const PaymentMethod(),
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
          onTap: onTap,
        ),
      ],
    );
  }
}
