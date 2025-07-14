import 'package:fashion/core/helper_functions/build_error_bar.dart';
import 'package:fashion/core/services/get_it_service.dart';
import 'package:fashion/features/splash/domains/repo/pay_repo.dart';
import 'package:fashion/features/splash/presentation/manager/cubits/pay/pay_cubit.dart';
import 'package:fashion/features/splash/presentation/views/widgets/pay.dart';
import 'package:fashion/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: BlocProvider(
        create: (context) => PayCubit(getIt<PayRepo>()),
        child: const SplashViewBodyBlocConsumer(),
      ),
    );
  }
}

class SplashViewBodyBlocConsumer extends StatefulWidget {
  const SplashViewBodyBlocConsumer({super.key});

  @override
  State<SplashViewBodyBlocConsumer> createState() =>
      _SplashViewBodyBlocConsumerState();
}

class _SplashViewBodyBlocConsumerState
    extends State<SplashViewBodyBlocConsumer> {
  @override
  void initState() {
    context.read<PayCubit>().pay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PayCubit, PayState>(
      listener: (context, state) {
        if (state is PayError) {
          showErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is PaySuccess) {
          if (state.ispaid == true) {
            return const SplashViewBody();
          } else {
            return const Pay();
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
