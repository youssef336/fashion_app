// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:fashion/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({required this.isblack, super.key});
  bool isblack = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Container(
        color: isblack ? Colors.black : Colors.transparent,
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.assetsImageMenu,
              color: isblack ? Colors.transparent : Colors.black,
            ),
            const Spacer(flex: 2),
            SvgPicture.asset(
              Assets.assetsImageLogoText,
              height: 36,
              color: isblack ? Colors.transparent : Colors.black,
            ),

            const Spacer(flex: 1),
            SvgPicture.asset(
              Assets.assetsImageSearch,
              height: 30,
              color: isblack ? Colors.transparent : Colors.black,
            ),
            const SizedBox(width: 19),
            SvgPicture.asset(
              Assets.assetsImageShoppingbag,
              height: 30,
              color: isblack ? Colors.transparent : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
