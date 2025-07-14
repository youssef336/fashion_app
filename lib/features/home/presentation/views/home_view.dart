import 'package:fashion/core/helper_functions/build_error_bar.dart';
import 'package:fashion/core/helper_functions/dummy_product_entity.dart';
import 'package:fashion/core/repo/fetchproduct/fetch_product_repo.dart';
import 'package:fashion/core/services/get_it_service.dart';
import 'package:fashion/features/home/presentation/manager/cubits/fetch_product/fetch_product_cubit.dart';
import 'package:fashion/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

class HomeViewBodyBlocConsumer extends StatefulWidget {
  const HomeViewBodyBlocConsumer({super.key});

  @override
  State<HomeViewBodyBlocConsumer> createState() =>
      _HomeViewBodyBlocConsumerState();
}

class _HomeViewBodyBlocConsumerState extends State<HomeViewBodyBlocConsumer> {
  @override
  void initState() {
    context.read<FetchProductCubit>().fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchProductCubit, FetchProductState>(
      listener: (context, state) {
        if (state is FetchProductError) {
          showErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is FetchProductSuccess) {
          return HomeViewBody(products: state.products);
        } else {
          return Skeletonizer(
            enabled: state is FetchProductLoading,
            child: HomeViewBody(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
