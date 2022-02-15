import 'package:conduit/models/auth_requirement_data.dart';
import 'package:conduit/models/credentials.dart';
import 'package:conduit/notifiers/auth_notifier.dart';
import 'package:conduit/notifiers/states/auth_states.dart';
import 'package:conduit/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements BaseAuthRepository {}

void main() {
  late final AuthNotifier sut;
  late final MockAuthRepository mockAuthRepository;
  final Credentials credentials = Credentials(
    user: User(
      bio: 'some bio',
      username: 'user',
      email: 'email',
      token: 'token',
      image: '',
    ),
  );
  final authData =
      AuthRequirementData(username: "username", password: "password");
  setUp(() {
    mockAuthRepository = MockAuthRepository();
    sut = AuthNotifier(mockAuthRepository);
  });

  test('test initial values', () {
    expect(sut.state, const AuthStates.initial());
  });

  group('Login methods', () {
    test('Test checkAuthStatus', () async {
      when(mockAuthRepository.checkAuthStatus())
          .thenReturn(Future.value(credentials));
      sut.checkAndUpdateAuthStatus();
      verify(() => mockAuthRepository.checkAuthStatus()).called(1);
    });
  });
}
