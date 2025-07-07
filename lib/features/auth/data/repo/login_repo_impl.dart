import 'package:dartz/dartz.dart';
import 'package:fashion/core/errors/failures.dart';
import 'package:fashion/core/services/main/auth_service.dart';
import 'package:fashion/features/auth/domain/repo/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepoImpl implements LoginRepo {
  final AuthService authService;

  LoginRepoImpl(this.authService);
  @override
  Future<Either<Failure, User>> loginUser(String email, String password) async {
    try {
      final user = await authService.loginUser(email, password);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
