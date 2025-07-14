import 'package:fashion/core/repo/fetchproduct/fetch_product_repo.dart';
import 'package:fashion/core/services/get_it_service.dart';
import 'package:fashion/features/home/presentation/manager/cubits/fetch_product/fetch_product_cubit.dart';
import 'package:fashion/features/home/presentation/views/widgets/home_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: BlocProvider(
        create: (context) => FetchProductCubit(getIt<FetchProductRepo>()),
        child: const HomeViewBodyBlocConsumer(),
      ),
    );
  }
}
