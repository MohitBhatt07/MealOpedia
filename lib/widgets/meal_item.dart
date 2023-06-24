import 'dart:ui';
import '../screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shopit/models/meal.dart';

class MealItems extends StatefulWidget {
  final String? id;
  final String? imageUrl;
  final String? title;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  const MealItems(
      {this.id,
      this.imageUrl,
      this.title,
      this.duration,
      this.complexity,
      this.affordability});

  @override
  State<MealItems> createState() => _MealItemsState();
}

class _MealItemsState extends State<MealItems> {
  String get affordabilityText {
    if (widget.affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (widget.affordability == Affordability.Pricey) {
      return 'Pricey';
    } else {
      return 'Luxurious';
    }
  }

  String get complexityText {
    if (widget.complexity == Complexity.Simple) {
      return 'Simple';
    } else if (widget.complexity == Complexity.Challenging) {
      return 'Challenging';
    } else {
      return 'Hard';
    }
  }

  bool isfav = false;
  int favColorIndex = 0;
  List<String> favouriteMeal = [];

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => selectMeal(context),
          child: Card(
            elevation: 20,
            shadowColor: Colors.blue,
            margin: const EdgeInsets.all(20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.imageUrl!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                height: 50,
                child: ClipRRect(
                  // borderRadius: const BorderRadius.only(
                  //     topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20,
                      sigmaY: 20,
                    ),
                    child: Container(
                      height: 180,
                      color: Colors.white.withOpacity(0.8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.access_time_sharp),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('${widget.duration.toString()} min')
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.work),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(complexityText),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.attach_money_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(affordabilityText),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                right: 0,
                left: 80,
                child: Container(
                  color: const Color.fromARGB(255, 14, 13, 13).withOpacity(0.5),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.title!,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
