import 'package:dartz/dartz.dart';
import 'package:fashion/core/errors/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<Either<Failure, User>> loginUser(String email, String password);
}
