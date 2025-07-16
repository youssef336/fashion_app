// ignore_for_file: deprecated_member_use

import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactInHome extends StatelessWidget {
  const ContactInHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.white,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.assetsImageTwiter, height: 30),
              const SizedBox(width: 40),
              SvgPicture.asset(Assets.assetsImageInstgram, height: 30),
              const SizedBox(width: 40),

              SvgPicture.asset(Assets.assetsImageYoutube, height: 30),
            ],
          ),
          const SizedBox(height: 30),
          SvgPicture.asset(
            Assets.assetsImageDivider,
            color: const Color(0xff555555),
            width: 160,
            height: 16,
          ),
          const SizedBox(height: 30),
          Text(
            "support@openui.design",
            style: TextStyles.tenor_VeryLarge_14.copyWith(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "+60 825 876",
            style: TextStyles.tenor_VeryLarge_14.copyWith(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),

          Text(
            "08:00 - 22:00 - Everyday",
            style: TextStyles.tenor_VeryLarge_14.copyWith(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 30),
          SvgPicture.asset(
            Assets.assetsImageDivider,
            color: const Color(0xff555555),
            width: 160,
            height: 16,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "About",
                style: TextStyles.bodyL_VeryLarge_16.copyWith(fontSize: 18),
              ),
              const SizedBox(width: 60),
              Text(
                "Contact",
                style: TextStyles.bodyL_VeryLarge_16.copyWith(fontSize: 18),
              ),
              const SizedBox(width: 60),

              Text(
                "Blog",
                style: TextStyles.bodyL_VeryLarge_16.copyWith(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            "Copyright© OpenUI All Rights Reserved.",
            style: TextStyles.tenor_Medium_14.copyWith(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
