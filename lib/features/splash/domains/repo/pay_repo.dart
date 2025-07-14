import 'package:dartz/dartz.dart';
import 'package:fashion/core/errors/failures.dart';

abstract class PayRepo {
  Future<Either<Failure, Map<String, dynamic>>> pay();
}
