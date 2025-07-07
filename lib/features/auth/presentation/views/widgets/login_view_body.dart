import 'package:fashion/features/auth/presentation/views/sign_up_view.dart';
import 'package:fashion/features/auth/presentation/views/widgets/hero_animation.dart';
import 'package:fashion/features/auth/presentation/views/widgets/login_logic.dart';
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

            const LoginLogic(),

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
