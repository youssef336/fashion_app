part of 'fetch_product_cubit.dart';

@immutable
abstract class FetchProductState {}

class FetchCubitInitial extends FetchProductState {}

class FetchProductLoading extends FetchProductState {}

class FetchProductSuccess extends FetchProductState {
  final List<ProductEntity> products;
  FetchProductSuccess(this.products);
}

class FetchProductError extends FetchProductState {
  final String message;
  FetchProductError(this.message);
}
