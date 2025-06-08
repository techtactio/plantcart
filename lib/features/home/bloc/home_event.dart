part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishlistNavigateClickedEvent extends HomeEvent {}

class HomeCartNavigateClickedEvent extends HomeEvent {}

class HomeWishlistClickedEvent extends HomeEvent {}

class HomeCartClickedEvent extends HomeEvent {}
