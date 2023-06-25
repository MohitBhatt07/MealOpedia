import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopit/main.dart';
import 'package:shopit/screens/favourites_screen.dart';
import 'package:shopit/screens/filter_screen.dart';
import 'package:shopit/screens/tab_screen.dart';

import '../models/meal.dart';
import '../screens/about_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(40),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                    color: Colors.white.withOpacity(0.6),

                    //color: Colors.white.withOpacity(0.8),
                    child: Drawer(
                        backgroundColor: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                                child: Image.asset('assets/mealOpedia.png')),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pushReplacementNamed(
                                    FilterScreen.routeName);
                              },
                              leading: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.filter_alt_outlined,
                                  size: 30,
                                  color: Color.fromARGB(255, 135, 18, 231),
                                ),
                              ),
                              title: const Text(
                                'Filter',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(TabScreen.routeName);
                              },
                              leading: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.food_bank_rounded,
                                    size: 30,
                                    color: Color.fromARGB(255, 135, 18, 231),
                                  )),
                              title: const Text(
                                'Meals',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pushReplacementNamed('/');
                              },
                              leading: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.art_track_sharp,
                                    size: 30,
                                    color: Color.fromARGB(255, 135, 18, 231),
                                  )),
                              title: const Text(
                                'Introduction Screen',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return MyPopup();
                                    });
                              },
                              leading: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.question_mark_outlined,
                                    size: 30,
                                    color: Color.fromARGB(255, 135, 18, 231),
                                  )),
                              title: const Text(
                                'About',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ],
                        ))))));
  }
}
