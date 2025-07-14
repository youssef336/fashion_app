import 'package:fashion/core/entities/product_entity.dart';
// ignore: unused_import
import 'package:fashion/core/helper_functions/dummy_product_entity.dart';
import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/features/home/domain/entities/cover_entity.dart';
import 'package:fashion/features/home/presentation/views/widgets/contact_in_home.dart';
import 'package:fashion/features/home/presentation/views/widgets/cover_item.dart';
import 'package:fashion/features/home/presentation/views/widgets/home_header.dart';
import 'package:fashion/features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeViewBody extends StatelessWidget {
  final List<ProductEntity> products;
  const HomeViewBody({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Header section
        const SliverToBoxAdapter(child: HomeHeader()),

        // GridView section
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
              mainAxisExtent: 300,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => ProductItem(product: products[index]),
              childCount: products.length <= 6 ? products.length : 6,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Text(
                "You may also like".toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 5),

              SvgPicture.asset(Assets.assetsImageDivider, width: 160),
              const SizedBox(height: 30),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 500, // Adjust this height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CoverItem(
                  image: CoverEntity.coverList[index].image,
                  title: CoverEntity.coverList[index].title,
                ),
              ),
              itemCount: 3,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: ContactInHome()),
      ],
    );
  }
}
