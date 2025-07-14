import 'package:fashion/core/helper_functions/build_error_bar.dart';
import 'package:fashion/core/helper_functions/dummy_product_entity.dart';
import 'package:fashion/core/repo/fetchproduct/fetch_product_repo.dart';
import 'package:fashion/core/services/get_it_service.dart';
import 'package:fashion/features/home/presentation/manager/cubits/fetch_product/fetch_product_cubit.dart';
import 'package:fashion/features/home/presentation/views/widgets/all_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

class AllProductViewBodyBlocConsumer extends StatefulWidget {
  const AllProductViewBodyBlocConsumer({super.key});

  @override
  State<AllProductViewBodyBlocConsumer> createState() =>
      _AllProductViewBodyBlocConsumerState();
}

class _AllProductViewBodyBlocConsumerState
    extends State<AllProductViewBodyBlocConsumer> {
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
          return AllProductViewBody(productList: state.products);
        } else {
          return Skeletonizer(
            enabled: state is FetchProductLoading,
            child: AllProductViewBody(productList: getDummyProducts()),
          );
        }
      },
    );
  }
}
