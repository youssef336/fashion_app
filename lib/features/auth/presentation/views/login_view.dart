import 'package:fashion/core/helper_functions/build_error_bar.dart';
import 'package:fashion/core/services/get_it_service.dart';
import 'package:fashion/core/widgets/custom_modal_progress_hub.dart';
import 'package:fashion/features/auth/domain/repo/login_repo.dart';
import 'package:fashion/features/auth/presentation/manager/cubits/login/login_cubit.dart';
import 'package:fashion/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fashion/features/auth/presentation/views/widgets/login_view_body_bloc_builder.dart';
import 'package:fashion/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(getIt<LoginRepo>()),
          child: const LoginViewBodyBlocBuilder(),
        ),
      ),
    );
  }
}
