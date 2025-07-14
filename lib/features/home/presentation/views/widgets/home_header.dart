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
          CustomAppBar(isblack: true),
          const SizedBox(height: 20),
          const StackFirstimage(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Text(
                  'New Arrivals',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AllProductView.routeName);
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      color: Color(0xffDD8560),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
