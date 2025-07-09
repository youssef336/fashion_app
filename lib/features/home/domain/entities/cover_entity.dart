import 'package:fashion/core/utils/assets.dart';

class CoverEntity {
  const CoverEntity({required this.title, required this.image});
  final String title;
  final String image;

  static List<CoverEntity> coverList = [
    const CoverEntity(
      title: "Black collection",
      image: Assets.assetsImageCover3,
    ),
    const CoverEntity(title: "HAE BY HAEKIM", image: Assets.assetsImageCover2),
    const CoverEntity(
      title: "Black collection",
      image: Assets.assetsImageCover1,
    ),
  ];
}
