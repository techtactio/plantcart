part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final HomePlantsDataModel removeItem;

  CartRemoveFromCartEvent({required this.removeItem});
}
