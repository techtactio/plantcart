import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/wishlist_items.dart';
import 'package:bloc_app/features/home/models/home_plants_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromeWishlistEvent>(wishlistRemoveFromeWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
    WishlistInitialEvent event,
    Emitter<WishlistState> emit,
  ) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveFromeWishlistEvent(
    WishlistRemoveFromeWishlistEvent event,
    Emitter<WishlistState> emit,
  ) {
    wishlistItems.remove(event.removeItem);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
