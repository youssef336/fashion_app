import 'package:fashion/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StackFirstimage extends StatelessWidget {
  const StackFirstimage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height:
          MediaQuery.of(context).size.height *
          0.8, // Set a fixed height or use MediaQuery for responsiveness
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: SvgPicture.asset(Assets.assetsImage10, height: 180),
          ),

          Positioned(
            right: -30,
            left: 0,
            top: 50,

            child: SvgPicture.asset(Assets.assetsImageOctober, height: 42),
          ),
          Positioned(
            right: -30,
            left: 0,
            top: 106,

            child: SvgPicture.asset(Assets.assetsImageCollection, width: 199),
          ),
          Positioned(
            right: -30,
            left: 0,
            top: 149,

            child: Image.asset(Assets.assetsImageImage20J),
          ),
          Positioned(
            right: -90,

            bottom: 40,

            child: SvgPicture.asset(
              Assets.assetsImage10,
              height: 250,

              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
