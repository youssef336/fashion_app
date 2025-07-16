import 'package:fashion/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CheckOutSecoundPhaseItem extends StatelessWidget {
  const CheckOutSecoundPhaseItem({
    super.key,
    required this.title,
    required this.SubTitle,
    required this.onTap,
  });
  final String title;
  final String SubTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyles.title_Medium_24.copyWith(
              color: Colors.grey,
              fontSize: 16,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    SubTitle,
                    style: TextStyles.bodyL_Large_16.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(onPressed: onTap, icon: const Icon(Icons.add)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
