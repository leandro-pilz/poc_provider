import 'package:poc_provider/core/entities/user_entity.dart';
import 'package:poc_provider/core/repositories/user_repository.dart';
import 'package:poc_provider/core/states/splash_state.dart';

final class UserRepositoryImp implements UserRepository {
  UserRepositoryImp();

  @override
  Future<UserState> logIn() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    return UserTokenState(token: '21721c48-abb1-4fe8-9830-d4f9d63b0e77');
  }

  @override
  Future<UserState> getUser({required String token}) async {
    await Future.delayed(const Duration(milliseconds: 3000));
    return UserGetSate(user: UserEntity(id: 1, name: 'user name'));
  }
}
