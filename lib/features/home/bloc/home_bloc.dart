import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeWishlistNavigateClickedEvent>(homeWishlistNavigateClickedEvent);
    on<HomeCartNavigateClickedEvent>(homeCartNavigateClickedEvent);
    on<HomeWishlistClickedEvent>(homeWishlistClickedEvent);
    on<HomeCartClickedEvent>(homeCartClickedEvent);
  }

  FutureOr<void> homeWishlistNavigateClickedEvent(
    HomeWishlistNavigateClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeNavigateToWishlistState());
  }

  FutureOr<void> homeCartNavigateClickedEvent(
    HomeCartNavigateClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeNavigateToCartState());
  }

  FutureOr<void> homeWishlistClickedEvent(
    HomeWishlistClickedEvent event,
    Emitter<HomeState> emit,
  ) {}

  FutureOr<void> homeCartClickedEvent(
    HomeCartClickedEvent event,
    Emitter<HomeState> emit,
  ) {}
}
