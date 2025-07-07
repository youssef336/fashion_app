import 'package:fashion/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black54,

      body: SignUpViewBody(),
    );
  }
}
