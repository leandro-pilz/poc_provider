import 'package:flutter/material.dart';
import 'package:poc_provider/core/entities/user_entity.dart';
import 'package:poc_provider/core/repositories/user_repository.dart';
import 'package:poc_provider/core/states/splash_state.dart';

class SplashController extends ValueNotifier<UserState> {
  final UserRepository _userRepository;
  UserEntity? _user;
  String? _token;

  UserEntity? get use => _user;

  UserState get state => value;

  SplashController({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserInitSate());

  void _emit(UserState newState) => value = newState;

  void getUser() async {
    _emit(UserLoadingState());

    final userState = await _userRepository.getUser(token: _token ?? '');

    if (userState is UserGetSate) {
      _user = userState.user;
    }

    _emit(userState);
  }

  void logIn() async {
    _emit(UserLoadingState());

    final userState = await _userRepository.login();

    if (userState is UserTokenState) {
      _token = userState.token;
    }

    _emit(userState);
  }
}
