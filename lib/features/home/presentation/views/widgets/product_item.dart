import 'package:fashion/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset(
              Assets.assetsImageFirstProduct,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 10),

          const Text(
            "title",
            style: TextStyle(color: Colors.white),
            maxLines: 1,
          ),
          const Text(
            "descriptionfsafasfsafsafsaffawf",
            style: TextStyle(color: Colors.grey),

            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Text("price", style: TextStyle(color: Color(0xffDD8560))),
        ],
      ),
    );
  }
}
