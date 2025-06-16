part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedsuccessState extends HomeState {
  final List<HomePlantsDataModel> products;
  final Set<int> wishlistedIds;
  final Set<int> cartedIds;

  HomeLoadedsuccessState({
    required this.products,
    required this.wishlistedIds,
    required this.cartedIds,
  });
}

class HomeErrorState extends HomeState {}

class HomeWishlistclickedState extends HomeActionState {
  final HomePlantsDataModel clickedProduct;

  HomeWishlistclickedState({required this.clickedProduct});
}

class HomeCartclickedState extends HomeActionState {
  final HomePlantsDataModel clickedProduct;

  HomeCartclickedState({required this.clickedProduct});
}

class HomeNavigateToWishlistState extends HomeActionState {}

class HomeNavigateToCartState extends HomeActionState {}
