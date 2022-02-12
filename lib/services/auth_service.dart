import 'package:conduit/models/credentials.dart';
import 'package:conduit/models/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class BaseAuthService {
  Future<Either<Credentials, Failure>> signIn({
    required String email,
    required String password,
  });
  Future<Either<Credentials, Failure>> signUp();
}
