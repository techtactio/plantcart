import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_app/main.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitialEvent>(splashInitialEvent);
  }

  FutureOr<void> splashInitialEvent(
    SplashInitialEvent event,
    Emitter<SplashState> emit,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final loggedin = sharedPrefs.getBool(logged);
    if (loggedin == null || loggedin == false) {
      emit(LoginFailedState());
    } else {
      emit(LoginSuccessState());
    }
  }
}
