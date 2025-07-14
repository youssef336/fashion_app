import 'package:dartz/dartz.dart';
import 'package:fashion/core/errors/failures.dart';

abstract class FetchProductRepo {
  Future<Either<Failure, List<Map<String, dynamic>>>> fetchProduct();
}
