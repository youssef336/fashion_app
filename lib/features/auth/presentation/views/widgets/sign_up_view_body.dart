import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/widgets/custom_buttom.dart';
import 'package:fashion/core/widgets/custom_text_feild.dart';
import 'package:fashion/features/auth/presentation/views/widgets/sign_up_logic.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 25, color: Colors.white70),
                ),
                const Spacer(),
                Hero(
                  tag: 'logo',
                  child: Material(
                    color: Colors.transparent,
                    child: Image.asset(Assets.assetsImageLogo, height: 200),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),
            const SignUpLogic(),
          ],
        ),
      ),
    );
  }
}
