import 'package:fashion/core/utils/text_styles.dart';
import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/features/home/presentation/views/all_product_view.dart';
import 'package:fashion/features/home/presentation/views/widgets/stack_first_image.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(isblack: true, isfirst: true),
          const SizedBox(height: 20),
          const StackFirstimage(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  'New Arrivals',
                  style: TextStyles.title_Large_24.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AllProductView.routeName);
                  },
                  child: Text(
                    'See All',
                    style: TextStyles.bodyL_Large_16.copyWith(
                      color: const Color(0xffDD8560),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
