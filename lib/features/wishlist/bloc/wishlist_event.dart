part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromeWishlistEvent extends WishlistEvent {
  final HomePlantsDataModel removeItem;

  WishlistRemoveFromeWishlistEvent({required this.removeItem});

  
}
