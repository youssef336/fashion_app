import 'package:fashion/core/repo/fetchproduct/fetch_product_repo.dart';
import 'package:fashion/core/repo/fetchproduct/fetch_product_repo_impl.dart';
import 'package:fashion/core/services/firebase_auth_service.dart';
import 'package:fashion/core/services/firebase_database_server.dart';
import 'package:fashion/core/services/main/auth_service.dart';
import 'package:fashion/core/services/main/database_service.dart';
import 'package:fashion/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fashion/features/auth/domain/repo/auth_repo.dart';
import 'package:fashion/features/splash/data/repo/pay_repo_impl.dart';
import 'package:fashion/features/splash/domains/repo/pay_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<DatabaseService>(() => FirebaseDatabaseServer());
  getIt.registerLazySingleton<FetchProductRepo>(
    () => FetchProductRepoImpl(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<AuthService>()),
  );
  getIt.registerLazySingleton<PayRepo>(
    () => PayRepoImpl(databaseService: getIt<DatabaseService>()),
  );
}
