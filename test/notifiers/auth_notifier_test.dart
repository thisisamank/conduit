// ignore_for_file: invalid_use_of_protected_member

import 'package:conduit/models/auth_requirement_data.dart';
import 'package:conduit/models/credentials.dart';
import 'package:conduit/models/failure.dart';
import 'package:conduit/notifiers/auth_notifier.dart';
import 'package:conduit/notifiers/states/auth_states.dart';
import 'package:conduit/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_notifier_test.mocks.dart';

@GenerateMocks([BaseAuthRepository])
void main() {
  late AuthNotifier sut;
  late MockBaseAuthRepository mockAuthRepository;
  final Credentials credentials = Credentials(
    user: User(
      bio: 'some bio',
      username: 'user',
      email: 'email',
      token: 'token',
      image: '',
    ),
  );
  final correctAuthData =
      AuthRequirementData(username: "username", password: "password");
  final incorrectAuthData =
      AuthRequirementData(username: "username1", password: "password1");
  setUp(() {
    mockAuthRepository = MockBaseAuthRepository();
    sut = AuthNotifier(mockAuthRepository);
  });

  test('Test initial values of stut', () {
    expect(sut.state, const AuthStates.initial());
  });

  group('Test chechAndUpdateAuthStatus', () {
    test('Test checkAuthStatus with correct credentials', () async {
      when(mockAuthRepository.checkAuthStatus())
          .thenAnswer((_) async => credentials);

      await sut.checkAndUpdateAuthStatus();

      verify(mockAuthRepository.checkAuthStatus()).called(1);
      expect(sut.state, AuthStates.authenticated(credentials));
    });
    test('Test checkAuthStatus with incorrect credentials', () async {
      when(mockAuthRepository.checkAuthStatus()).thenAnswer((_) async => null);

      await sut.checkAndUpdateAuthStatus();

      verify(mockAuthRepository.checkAuthStatus()).called(1);
      expect(sut.state, const AuthStates.unAuthenticated());
    });
  });

  group("Test signIn methods", () {
    test('test signIn method with correct auth values', () async {
      when(mockAuthRepository.signIn(authData: correctAuthData))
          .thenAnswer((_) async => right(credentials));
      when(mockAuthRepository.checkAuthStatus())
          .thenAnswer((_) async => credentials);

      await sut.signIn(correctAuthData);

      expect(sut.state, const AuthStates.initial());
      verify(await mockAuthRepository.signIn(authData: correctAuthData))
          .called(1);
      verify(await mockAuthRepository.checkAuthStatus()).called(1);
      expect(sut.state, AuthStates.authenticated(credentials));
    });
    test('test signIn method with incorrect auth values', () async {
      when(mockAuthRepository.signIn(authData: incorrectAuthData))
          .thenAnswer((_) async => left(Failure()));
      when(mockAuthRepository.checkAuthStatus()).thenAnswer((_) async => null);

      sut.signIn(incorrectAuthData);

      expect(sut.state, const AuthStates.initial());
      verify(await mockAuthRepository.signIn(authData: incorrectAuthData))
          .called(1);
      verifyNever(await mockAuthRepository.checkAuthStatus());
      expect(sut.state, AuthStates.failure(Failure().message));
    });
  });

  group("Test signUp methods", () {
    test('test signUp method with correct auth values', () async {
      when(mockAuthRepository.signUp(authData: correctAuthData))
          .thenAnswer((_) async => right(credentials));
      when(mockAuthRepository.checkAuthStatus())
          .thenAnswer((_) async => credentials);

      await sut.signUp(correctAuthData);

      expect(sut.state, const AuthStates.initial());
      verify(await mockAuthRepository.signUp(authData: correctAuthData))
          .called(1);
      verify(await mockAuthRepository.checkAuthStatus()).called(1);
      expect(sut.state, AuthStates.authenticated(credentials));
    });
    test('test signUp method with incorrect auth values', () async {
      when(mockAuthRepository.signUp(authData: incorrectAuthData))
          .thenAnswer((_) async => left(Failure()));
      when(mockAuthRepository.checkAuthStatus()).thenAnswer((_) async => null);

      await sut.signUp(incorrectAuthData);

      verify(await mockAuthRepository.signUp(authData: incorrectAuthData))
          .called(1);
      verifyNever(await mockAuthRepository.checkAuthStatus());
      expect(sut.state, AuthStates.failure(Failure().message));
    });
  });
}
