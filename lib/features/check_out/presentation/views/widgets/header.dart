// ignore_for_file: deprecated_member_use

import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/utils/text_styles.dart';
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
          style: TextStyles.title_Medium_24.copyWith(
            letterSpacing: 6,
            fontSize: 20,
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
