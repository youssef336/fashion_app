import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_first_phase.dart';
import 'package:fashion/features/check_out/presentation/views/widgets/check_out_secound_phase.dart';
import 'package:flutter/material.dart';

class CheckOutViewBody extends StatefulWidget {
  CheckOutViewBody({super.key, required this.product});
  final ProductEntity product;
  final ValueNotifier<int> counter = ValueNotifier(1);
  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final pages = [
      CheckOutFirstPhase(
        counter: widget.counter,
        onTap: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        product: widget.product,
      ),
      CheckOutSecoundPhase(counter: widget.counter, product: widget.product),
      // Add more phases here if needed
    ];

    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => pages[index],
      itemCount: pages.length,
    );
  }
}
