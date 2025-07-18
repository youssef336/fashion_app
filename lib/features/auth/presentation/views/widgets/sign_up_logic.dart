import 'package:fashion/core/widgets/custom_buttom.dart';
import 'package:fashion/core/widgets/custom_text_feild.dart';
import 'package:fashion/features/auth/presentation/manager/cubits/sign_up/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpLogic extends StatefulWidget {
  const SignUpLogic({super.key});

  @override
  State<SignUpLogic> createState() => _SignUpLogicState();
}

class _SignUpLogicState extends State<SignUpLogic> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();
  String? name, email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormFeild(
            hintText: 'Name',
            textInputType: TextInputType.name,
            onSaved: (p0) {
              name = p0;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormFeild(
            color: Colors.white,
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            onSaved: (p0) {
              email = p0;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormFeild(
            color: Colors.white,
            hintText: 'Password',
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
            onSaved: (p0) {
              password = p0;
            },
          ),
          const SizedBox(height: 40),
          CustomButtom(
            text: 'Sign Up',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<SignUpCubit>().signUpUser(
                  name: name!,
                  email: email!,
                  password: password!,
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
        ],
      ),
    );
  }
}
