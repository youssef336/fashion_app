import 'package:fashion/core/widgets/custom_buttom.dart';
import 'package:fashion/core/widgets/custom_text_feild.dart';
import 'package:fashion/features/auth/presentation/manager/cubits/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginLogic extends StatefulWidget {
  const LoginLogic({super.key});

  @override
  State<LoginLogic> createState() => _LoginLogicState();
}

class _LoginLogicState extends State<LoginLogic> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomTextFormFeild(
            textInputType: TextInputType.emailAddress,
            color: Colors.white,
            hintText: 'Email',
            maxLines: 1,
            obscureText: false,
            onSaved: (p0) {
              email = p0;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormFeild(
            color: Colors.white,
            textInputType: TextInputType.visiblePassword,
            hintText: 'Password',
            maxLines: 1,
            obscureText: true,
            onSaved: (p0) {
              password = p0;
            },
          ),
          const SizedBox(height: 60),
          CustomButtom(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<LoginCubit>().loginUser(email!, password!);
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            text: 'Login',
          ),
        ],
      ),
    );
  }
}
