import 'package:bloc_app/features/home/bloc/home_bloc.dart';
import 'package:bloc_app/features/home/models/home_plants_data_model.dart';
import 'package:bloc_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishlistTileWidget extends StatelessWidget {
  final HomePlantsDataModel homePlantsDataModel;
  final HomeBloc homeBloc;
  final WishlistBloc wishlistBloc;
  final bool isWishlisted;
  final bool isCarted;
  const WishlistTileWidget({
    super.key,
    required this.homePlantsDataModel,
    required this.wishlistBloc,
    required this.isWishlisted,
    required this.isCarted,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(homePlantsDataModel.image),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            homePlantsDataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            homePlantsDataModel.description,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs. ${homePlantsDataModel.price}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      wishlistBloc.add(
                        WishlistRemoveFromeWishlistEvent(
                          removeItem: homePlantsDataModel,
                        ),
                      );
                      homeBloc.add(HomeWishlistClickedEvent(clickedProduct: homePlantsDataModel));
                    },
                    icon: Icon(Icons.favorite, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
