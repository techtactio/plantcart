part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

class LoginSuccessState extends SplashState {}

class LoginFailedState extends SplashState {}
