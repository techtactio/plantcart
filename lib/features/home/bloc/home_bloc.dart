import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/cart_items.dart';
import 'package:bloc_app/data/plant_data.dart';
import 'package:bloc_app/data/wishlist_items.dart';
import 'package:bloc_app/features/home/models/home_plants_data_model.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<HomePlantsDataModel> products = [];
  Set<int> wishlistedIds = {};
  Set<int> cartedIds = {};
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistNavigateClickedEvent>(homeWishlistNavigateClickedEvent);
    on<HomeCartNavigateClickedEvent>(homeCartNavigateClickedEvent);
    on<HomeWishlistClickedEvent>(homeWishlistClickedEvent);
    on<HomeCartClickedEvent>(homeCartClickedEvent);
  }

  Future<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    products = PlantData.plants
        .map(
          (e) => HomePlantsDataModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            image: e['image'],
          ),
        )
        .toList();
    emit(
      HomeLoadedsuccessState(
        wishlistedIds: wishlistedIds,
        cartedIds: cartedIds,
        products: products,
      ),
    );
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
  ) {
    final id = event.clickedProduct.id;
    if (wishlistedIds.contains(id)) {
      wishlistedIds.remove(id);
      wishlistItems.remove(event.clickedProduct);
    } else {
      wishlistedIds.add(id);
      wishlistItems.add(event.clickedProduct);
    }

    emit(
      HomeLoadedsuccessState(
        wishlistedIds: wishlistedIds,
        cartedIds: cartedIds,
        products: products,
      ),
    );
  }

  FutureOr<void> homeCartClickedEvent(
    HomeCartClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    final id = event.clickedProduct.id;
    if (cartedIds.contains(id)) {
      cartedIds.remove(id);
      cartItems.remove(event.clickedProduct);
    } else {
      cartedIds.add(id);
      cartItems.add(event.clickedProduct);
    }

    emit(
      HomeLoadedsuccessState(
        wishlistedIds: wishlistedIds,
        cartedIds: cartedIds,
        products: products,
      ),
    );
  }
}
