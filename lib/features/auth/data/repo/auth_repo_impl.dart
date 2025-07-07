import 'package:dartz/dartz.dart';
import 'package:fashion/core/errors/failures.dart';
import 'package:fashion/core/services/main/auth_service.dart';
import 'package:fashion/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthService authService;

  AuthRepoImpl(this.authService);
  @override
  Future<Either<Failure, User>> loginUser(String email, String password) async {
    try {
      final user = await authService.loginUser(email, password);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await authService.signUpUser(
        name: name,
        email: email,
        password: password,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
