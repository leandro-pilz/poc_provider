import 'package:poc_provider/core/states/splash_state.dart';

abstract interface class UserRepository {
  Future<UserState> login();

  Future<UserState> getUser({required String token});
}
