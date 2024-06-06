import 'package:poc_provider/core/entities/user_entity.dart';

sealed class UserState {}

final class UserInitSate extends UserState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInitSate && runtimeType == other.runtimeType;

  @override
  int get hashCode => -1;
}

final class UserLoadingState extends UserState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLoadingState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

final class UserTokenState extends UserState {
  final String token;

  UserTokenState({required this.token});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTokenState &&
          runtimeType == other.runtimeType &&
          token == other.token;

  @override
  int get hashCode => token.hashCode;
}

final class UserGetSate extends UserState {
  final UserEntity user;

  UserGetSate({required this.user});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGetSate &&
          runtimeType == other.runtimeType &&
          user == other.user;

  @override
  int get hashCode => user.hashCode;
}

final class UserErrorState extends UserState {
  final String error;

  UserErrorState({required this.error});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserErrorState &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}
