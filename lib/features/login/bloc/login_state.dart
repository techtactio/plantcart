part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

//sealed class LoginActionState extends LoginState {}

final class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {}

class UsernameAndPasswordMismatchState extends LoginState {}

class LoginButtonClickedState extends LoginState {}
