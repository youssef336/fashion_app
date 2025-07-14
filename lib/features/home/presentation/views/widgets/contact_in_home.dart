// ignore_for_file: deprecated_member_use

import 'package:fashion/core/utils/assets.dart';
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
          const Text(
            "support@openui.design",
            style: TextStyle(color: Colors.black54, fontSize: 20),
          ),
          const SizedBox(height: 5),
          const Text(
            "+60 825 876",
            style: TextStyle(color: Colors.black54, fontSize: 20),
          ),
          const SizedBox(height: 5),

          const Text(
            "08:00 - 22:00 - Everyday",
            style: TextStyle(color: Colors.black54, fontSize: 20),
          ),
          const SizedBox(height: 30),
          SvgPicture.asset(
            Assets.assetsImageDivider,
            color: const Color(0xff555555),
            width: 160,
            height: 16,
          ),
          const SizedBox(height: 40),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("About", style: TextStyle(fontSize: 22)),
              SizedBox(width: 60),
              Text("Contact", style: TextStyle(fontSize: 22)),
              SizedBox(width: 60),

              Text("Blog", style: TextStyle(fontSize: 22)),
            ],
          ),
          const SizedBox(height: 25),
          const Text(
            "Copyright© OpenUI All Rights Reserved.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
