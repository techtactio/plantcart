part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishlistNavigateClickedEvent extends HomeEvent {}

class HomeCartNavigateClickedEvent extends HomeEvent {}

class HomeWishlistClickedEvent extends HomeEvent {
  final HomePlantsDataModel clickedProduct;

  HomeWishlistClickedEvent({required this.clickedProduct});
}

class HomeCartClickedEvent extends HomeEvent {
  final HomePlantsDataModel clickedProduct;

  HomeCartClickedEvent({required this.clickedProduct});
}
