import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favList;
  static const routeName = '/fav-screen';
  FavouritesScreen({required this.favList});

  @override
  Widget build(BuildContext context) {
    if (favList.isEmpty) {
      return const Center(
        child: Text('There is no favourite item'),
      );
    } else {
      return Container(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItems(
            id: favList[index].id,
            imageUrl: favList[index].imageUrl,
            title: favList[index].title,
            duration: favList[index].duration,
            complexity: favList[index].complexity,
            affordability: favList[index].affordability,
          );
        },
        itemCount: favList.length,
      ));
    }
  }
}
