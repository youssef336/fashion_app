import 'package:dartz/dartz.dart';
import 'package:fashion/core/errors/failures.dart';
import 'package:fashion/core/services/main/database_service.dart';
import 'package:fashion/core/utils/backendpoints.dart';
import 'package:fashion/features/splash/domains/repo/pay_repo.dart';

class PayRepoImpl implements PayRepo {
  final DatabaseService databaseService;
  PayRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, Map<String, dynamic>>> pay() async {
    try {
      var result = await databaseService.getData(
        path: Backendpoints.pay,
        documentId: "1",
      );
      return Right(result);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
