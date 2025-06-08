part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedsuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistState extends HomeActionState {}

class HomeNavigateToCartState extends HomeActionState {}
