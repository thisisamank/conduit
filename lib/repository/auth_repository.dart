import 'package:conduit/constants/api_endpoints.dart';
import 'package:conduit/models/auth_requirement_data.dart';
import 'package:conduit/models/credentials.dart';
import 'package:conduit/models/failure.dart';
import 'package:conduit/repository/local_storage/base_storage.dart';
import 'package:conduit/utils/dio_errors.dart';
import 'package:conduit/utils/response_conditions.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, Credentials>> signIn({
    required AuthRequirementData authData,
  });
  Future<Either<Failure, Credentials>> signUp({
    required AuthRequirementData authData,
  });
}

class AuthRepository implements BaseAuthRepository {
  AuthRepository(this._dio, this._baseStorage);
  final Dio _dio;
  final BaseStorage _baseStorage;
  @override
  Future<Either<Failure, Credentials>> signIn({
    required AuthRequirementData authData,
  }) async {
    try {
      final response =
          await _dio.post(ApiEndpoints.loginUrl, data: authData.toJson());
      if (successfulResponse(response.statusCode!)) {
        final credentials = Credentials.fromJson(response.data);
        _baseStorage.save(credentials);
        return right(credentials);
      }
      return left(Failure());
    } on DioError catch (e) {
      final error = DioErrorUtil.handleError(e);
      return left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, Credentials>> signUp({
    required AuthRequirementData authData,
  }) async {
    try {
      final response =
          await _dio.post(ApiEndpoints.registerUrl, data: authData.toJson());
      if (successfulResponse(response.statusCode!)) {
        final credentials = Credentials.fromJson(response.data);
        _baseStorage.save(credentials);
        return right(credentials);
      }
      return left(Failure());
    } on DioError catch (e) {
      final error = DioErrorUtil.handleError(e);
      return left(Failure(error));
    }
  }
}
