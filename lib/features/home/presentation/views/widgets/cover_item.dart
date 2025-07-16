import 'package:fashion/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CoverItem extends StatelessWidget {
  const CoverItem({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, height: 400),
        const SizedBox(height: 18),
        Text(
          title.toUpperCase(),
          style: TextStyles.tenor_Small_14.copyWith(
            color: Colors.white,
            letterSpacing: 3,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
