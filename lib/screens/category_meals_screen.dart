import 'package:flutter/material.dart';
import 'package:shopit/widgets/meal_item.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String id;
  // final String categoryTitle;
  // CategoryMeals(this.id, this.categoryTitle);
  List<Meal>? currMeals = [];
  CategoryMealsScreen({this.currMeals});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String?, String?>;
    final routeTitle = routeArgs['title'];
    final routeId = routeArgs['id'];

    final categoryMeals = currMeals!.where(
      (meal) {
        return meal.categories!.contains(routeId);
      },
    ).toList();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          title: Text(
            routeTitle!,
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          backgroundColor: const Color.fromARGB(255, 135, 18, 231),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItems(
              id: categoryMeals[index].id,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
