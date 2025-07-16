import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/amount.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_buttom.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_item.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutFirstPhase extends StatelessWidget {
  CheckOutFirstPhase({super.key, required this.product});
  final ValueNotifier<int> counter = ValueNotifier(1);
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
                const Header(text: "Check Out"),
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
                      style: TextStyle(fontSize: 15),
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
                    const Text("Delivery", style: TextStyle(fontSize: 15)),
                    const Spacer(),

                    const Text("Free", style: TextStyle(fontSize: 15)),
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
        const CheckOutButtom(),
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
              const Text(
                "Total",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const Spacer(),
              Text(
                "\$${result.toStringAsFixed(2)}",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        );
      },
    );
  }
}
