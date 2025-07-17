import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/utils/text_styles.dart';
import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_buttom.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_item.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutFirstPhase extends StatelessWidget {
  const CheckOutFirstPhase({
    super.key,
    required this.product,
    required this.onTap,
    required this.counter,
  });
  final ValueNotifier<int> counter;

  final void Function() onTap;
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                CustomAppBar(isblack: false),
                const SizedBox(height: 34),
                const Header(text: "CheckOut"),
                const SizedBox(height: 20),

                CheckOutItem(product: product, counter: counter),
                const SizedBox(height: 20),
                const Divider(thickness: 1, color: Color(0xff000000)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 25),
                    SvgPicture.asset(Assets.assetsImageDiscount, height: 20),
                    const SizedBox(width: 10),
                    const Text(
                      "Add promo code",
                      style: TextStyles.bodyL_Medium_16,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 1, color: Color(0xff000000)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 29),
                    SvgPicture.asset(Assets.assetsImageDoor, height: 25),
                    const SizedBox(width: 10),
                    const Text("Delivery", style: TextStyles.bodyL_Medium_16),
                    const Spacer(),

                    const Text("Free", style: TextStyles.bodyL_Medium_16),
                    const SizedBox(width: 29),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 1, color: Color(0xff000000)),
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

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.counter, required this.product});
  final ValueNotifier<int> counter;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: counter,
      builder: (context, value, _) {
        double result = value * product.price;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total", style: TextStyles.title_Medium_24),
              const Spacer(),
              Text(
                "\$${result.toStringAsFixed(2)}",
                style: TextStyles.price_Large_18.copyWith(
                  color: const Color(0xffDD8560),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
