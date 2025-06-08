import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/plant_data.dart';
import 'package:bloc_app/features/home/models/home_plants_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
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
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(HomeLoadedsuccessState(products: PlantData.plants.map((e)=>HomePlantsDataModel(id: e['id'], name: e['name'], description: e['description'], price: e['price'], image: e['image'])).toList()));
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
  ) {}

  FutureOr<void> homeCartClickedEvent(
    HomeCartClickedEvent event,
    Emitter<HomeState> emit,
  ) {}
}
