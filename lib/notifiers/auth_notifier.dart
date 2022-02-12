import 'package:conduit/models/auth_requirement_data.dart';
import 'package:conduit/models/credentials.dart';
import 'package:conduit/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends StateNotifier<AsyncValue<Credentials>> {
  AuthNotifier(this._authRepository) : super(const AsyncValue.loading());
  final BaseAuthRepository _authRepository;

  Future<void> signIn(AuthRequirementData authData) async {
    final authStatus = await _authRepository.signIn(authData: authData);
    state = authStatus.fold(
      (failure) => AsyncValue.error(failure),
      (credentials) => AsyncValue.data(credentials),
    );
  }

  Future<void> signUp(AuthRequirementData authData) async {
    final authStatus = await _authRepository.signIn(authData: authData);
    state = authStatus.fold(
      (failure) => AsyncValue.error(failure),
      (credentials) => AsyncValue.data(credentials),
    );
  }
}
