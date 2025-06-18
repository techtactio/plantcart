import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_app/main.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(loginInitialEvent);
    on<UsernameAndPasswordMismatchEvent>(usernameAndPasswordMismatchEvent);
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
  }

  FutureOr<void> loginInitialEvent(
    LoginInitialEvent event,
    Emitter<LoginState> emit,
  ) {}

  FutureOr<void> usernameAndPasswordMismatchEvent(
    UsernameAndPasswordMismatchEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(UsernameAndPasswordMismatchState());
  }

  FutureOr<void> loginButtonClickedEvent(
    LoginButtonClickedEvent event,
    Emitter<LoginState> emit,
  ) async {
    final username = event.username;
    final password = event.password;
    if (username == password) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(logged, true);
      emit(LoginSuccessState());
    } else {
      emit(UsernameAndPasswordMismatchState());
    }
  }
}
