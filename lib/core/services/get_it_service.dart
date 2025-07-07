import 'package:fashion/core/services/firebase_auth_service.dart';
import 'package:fashion/core/services/main/auth_service.dart';
import 'package:fashion/features/auth/data/repo/login_repo_impl.dart';
import 'package:fashion/features/auth/domain/repo/login_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(getIt<AuthService>()),
  );
}
