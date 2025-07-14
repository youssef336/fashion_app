import 'package:dartz/dartz.dart';
import 'package:fashion/core/errors/failures.dart';
import 'package:fashion/core/repo/fetchproduct/fetch_product_repo.dart';
import 'package:fashion/core/services/main/database_service.dart';
import 'package:fashion/core/utils/backendpoints.dart';

class FetchProductRepoImpl implements FetchProductRepo {
  final DatabaseService databaseService;

  FetchProductRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> fetchProduct() async {
    try {
      final data =
          await databaseService.getData(path: Backendpoints.fetchProduct)
              as List<Map<String, dynamic>>;
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
