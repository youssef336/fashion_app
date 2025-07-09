import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/core/widgets/custom_app_bar.dart';
import 'package:fashion/features/home/domain/entities/cover_entity.dart';
import 'package:fashion/features/home/presentation/views/all_product_view.dart';
import 'package:fashion/features/home/presentation/views/widgets/product_item.dart';
import 'package:fashion/features/home/presentation/views/widgets/stack_first_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(isblack: true),
                    const SizedBox(height: 20),
                    const StackFirstimage(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const Text(
                            'New Arrivals',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AllProductView.routeName,
                              );
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                color: Color(0xffDD8560),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

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
                  (context, index) => const ProductItem(),
                  childCount: 6,
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
          ],
        ),
      ),
    );
  }
}

class CoverItem extends StatelessWidget {
  const CoverItem({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, height: 400),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            letterSpacing: 2,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
