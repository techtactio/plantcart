part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

sealed class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<HomePlantsDataModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});
}

class WishlistRemoveFromWishlistState extends WishlistState {}
