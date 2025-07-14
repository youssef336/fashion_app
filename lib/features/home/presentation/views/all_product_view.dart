import 'package:fashion/core/repo/fetchproduct/fetch_product_repo.dart';
import 'package:fashion/core/services/get_it_service.dart';
import 'package:fashion/features/home/presentation/manager/cubits/fetch_product/fetch_product_cubit.dart';

import 'package:fashion/features/home/presentation/views/widgets/all_product_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({super.key});
  static const String routeName = "AllProductView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => FetchProductCubit(getIt<FetchProductRepo>()),
          child: const AllProductViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
