import 'package:conduit/models/auth_requirement_data.dart';
import 'package:conduit/notifiers/states/auth_states.dart';
import 'package:conduit/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthStates> {
  AuthNotifier(this._authRepository) : super(const AuthStates.initial());
  final BaseAuthRepository _authRepository;

  Future<void> checkAndUpdateAuthStatus() async {
    final credentials = await _authRepository.checkAuthStatus();
    if (credentials != null) {
      state = AuthStates.authenticated(credentials);
      return;
    }
    state = const AuthStates.unAuthenticated();
  }

  Future<void> signIn(AuthRequirementData authData) async {
    final authStatus = await _authRepository.signIn(authData: authData);
    authStatus.fold(
      (failure) => state = AuthStates.failure(failure.message),
      (credentials) => checkAndUpdateAuthStatus(),
    );
  }

  Future<void> signUp(AuthRequirementData authData) async {
    final authStatus = await _authRepository.signIn(authData: authData);
    authStatus.fold(
      (failure) => state = AuthStates.failure(failure.message),
      (credentials) => checkAndUpdateAuthStatus(),
    );
  }

  Future<void> signout() async {
    await _authRepository.signout();
    checkAndUpdateAuthStatus();
  }
}
