part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<HomePlantsDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class CartRemoveFromCartState extends CartState {}
