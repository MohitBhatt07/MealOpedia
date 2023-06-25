import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:shopit/screens/category_meals_screen.dart';
// import '../screens/category_meals_screen.dart';

class CategoryItems extends StatelessWidget {
  final Color? color;
  final String? title;
  final String? id;
  final String? imageAddress;
  CategoryItems({this.title, this.color, this.id, this.imageAddress});

  // void showDetails(BuildContext ctx) {
  //   Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
  //     return CategoryMeals(id!, title!);
  //   }));
  // }
  void showDetails(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/cat', arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDetails(context);
      },
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      splashColor: Colors.pink,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        // padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 4,
                  offset: Offset(2, 3),
                  color: Color.fromARGB(255, 161, 159, 159))
            ],
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              color!.withOpacity(0.8),
              color!,
            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Stack(children: [
              Positioned(
                  top: 10,
                  left: 20,
                  child: Text(
                    title!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )),
              Positioned(
                bottom: 0,
                right: 0,
                top: 40,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.3)
                          ]),
                      color: Colors.white.withOpacity(0.3)),
                  child: Image.network(
                    alignment: Alignment.topLeft,
                    imageAddress!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
