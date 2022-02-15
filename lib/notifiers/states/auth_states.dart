import 'package:conduit/models/credentials.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_states.freezed.dart';

@freezed
class AuthStates with _$AuthStates {
  const factory AuthStates.initial() = _Initial;
  const factory AuthStates.unAuthenticated() = _UnAuthenticated;
  const factory AuthStates.authenticated(Credentials credentials) =
      _Authenticated;
  const factory AuthStates.failure([String? message]) = _AuthFailure;
}
