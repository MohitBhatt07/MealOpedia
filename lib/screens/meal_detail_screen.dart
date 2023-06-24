import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/middle_navbar.dart';

class MealDetailScreen extends StatelessWidget {
  Function toggleFav;
  Function isFav;
  MealDetailScreen({required this.toggleFav, required this.isFav});
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgsId = ModalRoute.of(context)!.settings.arguments as String;
    final currMeal = dummyMeals.firstWhere((meal) => meal.id == routeArgsId);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 135, 18, 231),
          title: Text(currMeal.title!),
        ),
        body: Column(
          children: [
            Image.network(currMeal.imageUrl!),
            SingleChildScrollView(
              child: Container(
                height: 400,
                child: MiddleNavigationBarPage(
                    steps: currMeal.steps,
                    ingredients: currMeal.ingredients,
                    videoAddress: currMeal.videoAddress),
              ),
            ),
          ],
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            focusColor: Colors.black,
            backgroundColor: const Color.fromARGB(255, 139, 238, 238),
            onPressed: () => toggleFav(currMeal.id),
            child: (isFav(currMeal.id))
                ? const Icon(
                    Icons.favorite_sharp,
                    color: Color.fromARGB(255, 173, 7, 160),
                    size: 40,
                  )
                : const Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                    size: 30,
                  )));
  }
}
