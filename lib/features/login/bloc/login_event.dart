part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class UsernameAndPasswordMismatchEvent extends LoginEvent {}

class LoginButtonClickedEvent extends LoginEvent {
  final String username;
  final String password;

  LoginButtonClickedEvent({required this.username, required this.password});
  
}
