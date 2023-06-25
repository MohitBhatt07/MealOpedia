import 'dart:ui';
import 'package:shopit/screens/favourites_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:shopit/screens/intro_screen.dart';
import './dummy_data.dart';
import '../models/meal.dart';
import 'package:flutter/material.dart';
import './screens/tab_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/filter_screen.dart';

void main() => runApp(
      DevicePreview(
        enabled: false,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => Mealopedia(), // Wrap your app
      ),
    );

class Mealopedia extends StatefulWidget {
  @override
  State<Mealopedia> createState() => _MealopediaState();
}

class _MealopediaState extends State<Mealopedia> {
  Map<String, bool> filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };

  List<Meal> favMeals = [];

  void applyFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      currentMeals = dummyMeals.where((meal) {
        if (filters['Gluten']! && !meal.isGlutenFree!) {
          return false;
        }
        if (filters['Lactose']! && !meal.isLactoseFree!) {
          return false;
        }
        if (filters['Vegan']! && !meal.isVegan!) {
          return false;
        }
        if (filters['Vegetarian']! && !meal.isVegetarian!) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFav(String mealId) {
    final existingIndex = favMeals.indexWhere((meal) {
      return mealId == meal.id;
    });
    if (existingIndex >= 0) {
      setState(() {
        favMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isfavMeal(String mealId) {
    return favMeals.any((meal) => meal.id == mealId);
  }

  List<Meal> currentMeals = dummyMeals;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ShopIt",
      //home: _MyHomePage(),
      routes: {
        '/': (context) => IntroScreen(favMeals: favMeals),
        '/cat': (context) => CategoryMealsScreen(currMeals: currentMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
              toggleFav: toggleFav,
              isFav: isfavMeal,
            ),
        FilterScreen.routeName: (context) => FilterScreen(
              applyFilters: applyFilters,
              currentFilters: filters,
            ),
        FavouritesScreen.routeName: (context) =>
            FavouritesScreen(favList: favMeals),
        TabScreen.routeName: (context) => TabScreen(favMeals: favMeals),
      },
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage();

  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  final appBar = AppBar(
    elevation: 0,
    title: const Text(
      "Shop It",
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: const Color.fromARGB(255, 135, 18, 231),
  );

  @override
  Widget build(BuildContext context) {
    final mediaQeury = MediaQuery.of(context).size;
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: appBar,
      body: Stack(children: [
        Container(
            height: mediaQeury.height,
            width: mediaQeury.width,
            color: const Color.fromARGB(255, 255, 252, 251),
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.fill,
            )),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 85,
            sigmaY: 85,
          ),
          child: Container(
            color: Colors.transparent,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 10), child: CategoriesScreen())
      ]),
    );
  }
}
