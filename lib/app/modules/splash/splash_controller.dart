import 'package:flutter/material.dart';
import 'package:poc_provider/core/entities/user_entity.dart';
import 'package:poc_provider/core/repositories/user_repository.dart';
import 'package:poc_provider/core/states/splash_state.dart';

class SplashController extends ValueNotifier<UserState> {
  final UserRepository _userRepository;
  UserEntity? _user;
  String? _token;

  UserState get state => value;

  SplashController({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserInitSate());

  void _emit({required UserState state}) {
    value = state;
  }

  Future<void> getUser() async {
    _emit(state: UserLoadingState());

    final userState = await _userRepository.getUser(token: _token ?? '');

    if (userState is UserGetSate) {
      _user = userState.user;
    }

    _emit(state: userState);
  }

  Future<void> logIn() async {
    _emit(state: UserLoadingState());

    final userState = await _userRepository.logIn();

    if (userState is UserTokenState) {
      _token = userState.token;
    }

    _emit(state: userState);
  }
}
