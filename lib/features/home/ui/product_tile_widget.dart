import 'package:bloc_app/features/home/bloc/home_bloc.dart';
import 'package:bloc_app/features/home/models/home_plants_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final HomePlantsDataModel homePlantsDataModel;
  final HomeBloc homeBloc;
  final bool isWishlisted;
  final bool isCarted;
  const ProductTileWidget({super.key, required this.homePlantsDataModel, required this.homeBloc, required this.isWishlisted, required this.isCarted});

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
                      homeBloc.add(
                        HomeWishlistClickedEvent(
                          clickedProduct: homePlantsDataModel,
                        ),
                      );
                    },
                    icon: Icon(
                      isWishlisted ? Icons.favorite : Icons.favorite_border_sharp,
                      color: isWishlisted ? Colors.red : Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeCartClickedEvent(
                          clickedProduct: homePlantsDataModel,
                        ),
                      );
                    },
                    icon: Icon(isCarted?Icons.shopping_cart:Icons.shopping_cart_outlined,
                    color: isCarted?Colors.green:Colors.black,),
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
