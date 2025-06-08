import 'package:bloc_app/features/home/models/home_plants_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final HomePlantsDataModel homePlantsDataModel;
  const ProductTileWidget({super.key, required this.homePlantsDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(homePlantsDataModel.image))
            ),
          ),
          const SizedBox(height: 10,),
          Text(homePlantsDataModel.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text(homePlantsDataModel.description,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rs. ${homePlantsDataModel.price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                     // homebloc.add(HomeWishlistNavigateClickedEvent());
                    },
                    icon: Icon(Icons.favorite_border_sharp),
                  ),
                  IconButton(
                    onPressed: () {
                      //homebloc.add(HomeCartNavigateClickedEvent());
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
              ],
            )
            ],
          ),
          
        ],
      ),
    );
  }
}