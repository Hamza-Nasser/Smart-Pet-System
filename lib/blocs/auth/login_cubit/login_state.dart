part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String? successMsg;
  LoginSuccess(this.successMsg);
}

class LoginError extends LoginState {
  final String? errorMsg;
  LoginError(this.errorMsg);
}
