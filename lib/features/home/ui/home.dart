import 'package:bloc_app/features/cart/ui/cart.dart';
import 'package:bloc_app/features/home/bloc/home_bloc.dart';
import 'package:bloc_app/features/home/ui/product_tile_widget.dart';
import 'package:bloc_app/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homebloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homebloc = HomeBloc();
  Set<int> wishlistedIds = {};
  Set<int> cartedIds = {};
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Wishlist(homeBloc: homebloc,)),
          );
        } else if (state is HomeNavigateToCartState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart(homeBloc: homebloc,)),
          );
        } else if (state is HomeWishlistclickedState) {
          wishlistedIds.add(state.clickedProduct.id);
        } else if (state is HomeCartclickedState) {
          cartedIds.add(state.clickedProduct.id);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadedsuccessState):
            final successState = state as HomeLoadedsuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text("Plant App"),
                actions: [
                  IconButton(
                    onPressed: () {
                      homebloc.add(HomeWishlistNavigateClickedEvent());
                    },
                    icon: Icon(Icons.favorite_border_sharp),
                  ),
                  IconButton(
                    onPressed: () {
                      homebloc.add(HomeCartNavigateClickedEvent());
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    homeBloc: homebloc,
                    homePlantsDataModel: successState.products[index],
                    isWishlisted: successState.wishlistedIds.contains(
                      successState.products[index].id,
                    ),
                    isCarted: successState.cartedIds.contains(
                      successState.products[index].id,
                    ),
                  );
                },
              ),
            );
          case const (HomeErrorState):
            return Scaffold(body: Center(child: Text("Error")));
          default:
            return SizedBox();
        }
      },
    );
  }
}
