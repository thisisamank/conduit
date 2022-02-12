import 'package:conduit/models/auth_requirement_data.dart';
import 'package:conduit/notifiers/auth_notifier.dart';
import 'package:conduit/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements BaseAuthRepository {}

void main() {
  late final AuthNotifier sut;
  late final MockAuthRepository authRepository;
  final authData =
      AuthRequirementData(username: "username", password: "password");
  setUp(() {
    authRepository = MockAuthRepository();
    sut = AuthNotifier(authRepository);
  });

  test('lkjsd lksjd', () {
    sut.signIn(authData);
    verify(() => authRepository.signIn(authData: authData)).called(1);
    expect(0, 0);
  });
}
