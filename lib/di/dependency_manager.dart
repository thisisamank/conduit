import 'package:conduit/models/credentials.dart';
import 'package:conduit/repository/article_repository.dart';
import 'package:conduit/repository/auth_repository.dart';
import 'package:conduit/repository/local_storage/base_storage.dart';
import 'package:conduit/repository/local_storage/credential_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
const bool showApiLogs = true;

void setUpDependencies() {
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  getIt.registerSingleton<UserManager>(UserManager());
  getIt.registerSingleton<Dio>(
    Dio()
      ..interceptors.addAll([
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (user != null) {
              options.headers['Authorization'] = 'Bearer ${user!.token}';
            }
            handler.next(options);
          },
        ),
        if (showApiLogs) LogInterceptor()
      ]),
  );
  getIt.registerSingleton<BaseStorage<Credentials>>(
      CredentialStorage(flutterSecureStorage));
  getIt.registerSingleton<BaseAuthRepository>(
      AuthRepository(dio, credentialStorage));
  getIt.registerSingleton<BaseArticleRepository>(ArticleRepository(dio));
}

final dio = getIt.get<Dio>();
final flutterSecureStorage = getIt.get<FlutterSecureStorage>();
final credentialStorage = getIt.get<BaseStorage<Credentials>>();
final authRepository = getIt.get<BaseAuthRepository>();
final userManager = getIt.get<UserManager>();
final articleRepository = getIt.get<BaseArticleRepository>();
final user = userManager.user;
