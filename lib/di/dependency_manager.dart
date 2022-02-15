import 'package:conduit/models/credentials.dart';
import 'package:conduit/repository/auth_repository.dart';
import 'package:conduit/repository/local_storage/base_storage.dart';
import 'package:conduit/repository/local_storage/credential_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
const bool showApiLogs = false;

void setUpDependencies() {
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  getIt.registerSingleton<UserManager>(UserManager());
  getIt.registerSingleton<Dio>(Dio()
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
    ]));
  getIt.registerSingleton<BaseStorage<Credentials>>(
      CredentialStorage(flutterSecureStorage));
  getIt.registerSingleton<BaseAuthRepository>(
      AuthRepository(dio, credentialStorage));
}

final dio = getIt.get<Dio>();
final flutterSecureStorage = getIt.get<FlutterSecureStorage>();
final credentialStorage = getIt.get<BaseStorage<Credentials>>();
final userManager = getIt.get<UserManager>();
final user = userManager.user;
