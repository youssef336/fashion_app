// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:fashion/core/entities/product_entity.dart';
import 'package:fashion/core/models/product_model.dart';
import 'package:fashion/core/repo/fetchproduct/fetch_product_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_product_state.dart';

class FetchProductCubit extends Cubit<FetchProductState> {
  final List<ProductEntity> products = [];

  final FetchProductRepo fetchProductRepo;
  FetchProductCubit(this.fetchProductRepo) : super(FetchCubitInitial());

  Future<void> fetchProduct() async {
    emit(FetchProductLoading());
    final result = await fetchProductRepo.fetchProduct();
    result.fold((l) => emit(FetchProductError(l.message)), (r) {
      for (var element in r) {
        products.add(ProductModel.fromJson(element).toEntity());
      }
      emit(FetchProductSuccess(products));
    });
  }
}
