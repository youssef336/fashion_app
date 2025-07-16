import 'package:fashion/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 30,
            letterSpacing: 6,
            fontWeight: FontWeight.w400,
          ),
        ),
        SvgPicture.asset(
          Assets.assetsImageDivider,
          width: 210,
          color: const Color(0xff555555),
        ),
      ],
    );
  }
}
