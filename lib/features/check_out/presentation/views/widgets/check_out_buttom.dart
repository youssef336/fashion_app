import 'package:fashion/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckOutButtom extends StatelessWidget {
  CheckOutButtom({super.key, this.onTap, this.image, required this.text});
  final void Function()? onTap;
  String? image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.black,
        height: 70,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image == null ? const SizedBox() : SvgPicture.asset(image!),
              const SizedBox(width: 10),
              Text(
                text.toUpperCase(),
                style: TextStyles.title_Medium_24.copyWith(
                  fontSize: 22,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
