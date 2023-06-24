import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String? id;
  final String? title;
  final List<String>? categories;
  final String? imageUrl;
  final List<String>? ingredients;
  final Complexity? complexity;
  final List<String>? steps;
  final int? duration;
  final Affordability? affordability;
  final bool? isVegan;
  final bool? isVegetarian;
  final bool? isGlutenFree;
  final bool? isLactoseFree;
  final String? videoAddress;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.complexity,
    @required this.steps,
    @required this.duration,
    @required this.affordability,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.videoAddress,
  });
}
