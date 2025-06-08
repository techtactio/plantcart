import 'package:bloc_app/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homebloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
        );
      },
    );
  }
}
