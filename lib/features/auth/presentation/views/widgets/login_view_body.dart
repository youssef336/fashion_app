import 'package:fashion/core/widgets/custom_buttom.dart';
import 'package:fashion/core/widgets/custom_text_feild.dart';
import 'package:fashion/features/auth/presentation/views/sign_up_view.dart';
import 'package:fashion/features/auth/presentation/views/widgets/hero_animation.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HeroAnimation(),

            const SizedBox(height: 20),
            const CustomTextFormFeild(
              textInputType: TextInputType.emailAddress,
              hintText: 'Email',
              maxLines: 1,
              obscureText: false,
            ),
            const SizedBox(height: 20),
            const CustomTextFormFeild(
              textInputType: TextInputType.visiblePassword,
              hintText: 'Password',
              maxLines: 1,
              obscureText: true,
            ),
            const SizedBox(height: 60),
            const CustomButtom(text: 'Login'),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SignUpView.routeName);
              },
              child: const Text(
                "Don't have an account ?",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
