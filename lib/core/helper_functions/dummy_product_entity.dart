import 'package:fashion/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: "Shirt",
    price: 5000,
    description: "Shirt description",
    image:
        "https://tse3.mm.bing.net/th/id/OIP.xZGkTQ3grFSh1zI1z9WTewHaJn?pid=Api&P=0&h=220",
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(6, (index) => getDummyProduct());
}
