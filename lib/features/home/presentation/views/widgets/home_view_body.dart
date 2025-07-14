import 'package:fashion/core/utils/assets.dart';
import 'package:fashion/features/home/domain/entities/cover_entity.dart';
import 'package:fashion/features/home/presentation/views/widgets/cover_item.dart';
import 'package:fashion/features/home/presentation/views/widgets/home_header.dart';
import 'package:fashion/features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
        SliverToBoxAdapter(
          child: Container(
            height: 400,
            color: Colors.white,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.assetsImageTwiter, height: 30),
                    const SizedBox(width: 40),
                    SvgPicture.asset(Assets.assetsImageInstgram, height: 30),
                    const SizedBox(width: 40),

                    SvgPicture.asset(Assets.assetsImageYoutube, height: 30),
                  ],
                ),
                const SizedBox(height: 30),
                SvgPicture.asset(
                  Assets.assetsImageDivider,
                  color: const Color(0xff555555),
                  width: 160,
                  height: 16,
                ),
                const SizedBox(height: 30),
                const Text(
                  "support@openui.design",
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
                const SizedBox(height: 5),
                const Text(
                  "+60 825 876",
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
                const SizedBox(height: 5),

                const Text(
                  "08:00 - 22:00 - Everyday",
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
                const SizedBox(height: 30),
                SvgPicture.asset(
                  Assets.assetsImageDivider,
                  color: const Color(0xff555555),
                  width: 160,
                  height: 16,
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("About", style: TextStyle(fontSize: 22)),
                    SizedBox(width: 60),
                    Text("Contact", style: TextStyle(fontSize: 22)),
                    SizedBox(width: 60),

                    Text("Blog", style: TextStyle(fontSize: 22)),
                  ],
                ),
                const SizedBox(height: 25),
                const Text(
                  "Copyright© OpenUI All Rights Reserved.",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
