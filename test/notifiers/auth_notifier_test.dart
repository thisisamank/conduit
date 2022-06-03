// ignore_for_file: invalid_use_of_protected_member

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
      when(mockAuthRepository.signIn(emailId: 'email', password: 'password'))
          .thenAnswer((_) async => right(credentials));
      when(mockAuthRepository.checkAuthStatus())
          .thenAnswer((_) async => credentials);

      await sut.signIn(emailId: 'email', password: 'password');

      expect(sut.state, const AuthStates.initial());
      verify(await mockAuthRepository.signIn(
              emailId: 'email', password: 'password'))
          .called(1);
      verify(await mockAuthRepository.checkAuthStatus()).called(1);
      expect(sut.state, AuthStates.authenticated(credentials));
    });
    test('test signIn method with incorrect auth values', () async {
      when(mockAuthRepository.signIn(emailId: 'email', password: 'password'))
          .thenAnswer((_) async => left(Failure()));
      when(mockAuthRepository.checkAuthStatus()).thenAnswer((_) async => null);

      sut.signIn(emailId: 'email', password: 'password');

      expect(sut.state, const AuthStates.initial());
      verify(await mockAuthRepository.signIn(
              emailId: 'email', password: 'password'))
          .called(1);
      verifyNever(await mockAuthRepository.checkAuthStatus());
      expect(sut.state, AuthStates.failure(Failure().message));
    });
  });

  group("Test signUp methods", () {
    test('test signUp method with correct auth values', () async {
      when(mockAuthRepository.signUp(
        emailId: 'email',
        password: 'password',
        username: 'user',
      )).thenAnswer((_) async => right(credentials));
      when(mockAuthRepository.checkAuthStatus())
          .thenAnswer((_) async => credentials);

      await sut.signUp(
        emailId: 'email',
        password: 'password',
        username: 'user',
      );

      expect(sut.state, const AuthStates.initial());
      verify(await mockAuthRepository.signUp(
        emailId: 'email',
        password: 'password',
        username: 'user',
      ))
          .called(1);
      verify(await mockAuthRepository.checkAuthStatus()).called(1);
      expect(sut.state, AuthStates.authenticated(credentials));
    });
    test('test signUp method with incorrect auth values', () async {
      when(mockAuthRepository.signUp(
        emailId: 'email',
        password: 'password',
        username: 'user',
      )).thenAnswer((_) async => left(Failure()));
      when(mockAuthRepository.checkAuthStatus()).thenAnswer((_) async => null);

      await sut.signUp(
        emailId: 'email',
        password: 'password',
        username: 'user',
      );

      verify(await mockAuthRepository.signUp(
        emailId: 'email',
        password: 'password',
        username: 'user',
      ))
          .called(1);
      verifyNever(await mockAuthRepository.checkAuthStatus());
      expect(sut.state, AuthStates.failure(Failure().message));
    });
  });
}
