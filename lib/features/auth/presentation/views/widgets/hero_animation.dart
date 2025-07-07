import 'package:fashion/core/utils/assets.dart';
import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Hero(
          tag: 'text',
          child: Material(
            color: Colors.transparent,
            child: Text(
              "Fashion Store",
              style: TextStyle(fontSize: 25, color: Colors.white70),
            ),
          ),
        ),
        const SizedBox(height: 80),
        Center(
          child: Hero(
            tag: 'logo',
            child: Material(
              color: Colors.transparent,
              child: Image.asset(Assets.assetsImageLogo, height: 300),
            ),
          ),
        ),
      ],
    );
  }
}
