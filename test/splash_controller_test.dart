import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc_provider/app/modules/splash/splash_controller.dart';
import 'package:poc_provider/core/entities/user_entity.dart';
import 'package:poc_provider/core/repositories/user_repository.dart';
import 'package:poc_provider/core/states/splash_state.dart';

import 'splash_controller_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late UserRepository userRepository;
  late SplashController controller;

  setUp(() {
    userRepository = MockUserRepository();
    controller = SplashController(userRepository: userRepository);
  });

  test('Teste getUser retornando UserGetSate.', () async {
    //setup
    const token = '';
    final user = UserEntity(id: 1, name: 'user teste');
    final userState = UserGetSate(user: user);
    provideDummy<UserState>(userState);
    when(userRepository.getUser(token: token)).thenAnswer((_) async => userState);

    //Execução
    await controller.getUser();

    //Validação
    expect(controller.state, isA<UserGetSate>());
    expect((controller.state as UserGetSate).user.id, user.id);
    expect((controller.state as UserGetSate).user.name, user.name);
    verify(userRepository.getUser(token: token));
  });

  test('Teste getUser retornando login.', () async {
    //setup
    const token = '36416cd1-52c9-4df4-8489-47be2d37d615';
    final tokenState = UserTokenState(token: token);
    provideDummy<UserState>(tokenState);
    when(userRepository.logIn()).thenAnswer((_) async => tokenState);

    //Execução
    await controller.logIn();

    //Validação
    expect(controller.state, isA<UserTokenState>());
    expect((controller.state as UserTokenState).token, token);
    verify(userRepository.logIn());
  });
}
