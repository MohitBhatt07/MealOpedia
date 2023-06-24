import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopit/screens/tab_screen.dart';
import 'package:shopit/widgets/main_drawer.dart';
import 'package:flutter/foundation.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  Function applyFilters = () {};
  Map<String, bool> currentFilters = {};
  FilterScreen({required this.applyFilters, required this.currentFilters});

  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFree = false;

  var isVegan = false;

  var isVegetarian = false;

  var isLactoseFree = false;

  void initState() {
    isGlutenFree = widget.currentFilters['Gluten']!;

    isVegan = widget.currentFilters['Vegan']!;

    isVegetarian = widget.currentFilters['Vegetarian']!;

    isLactoseFree = widget.currentFilters['Lactose']!;

    super.initState();
  }

  SwitchListTile buildSwitch(
      String title, String subtitle, bool switchVal, Function switchHandler) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: switchVal,
      activeTrackColor: const Color.fromARGB(255, 135, 18, 231),
      inactiveThumbColor: Colors.amberAccent,
      onChanged: (value) {
        return switchHandler(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Filters",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 135, 18, 231),
        ),
        body: Column(
          children: [
            Container(
              child: const Text(
                'Filter Your Meal',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              child: ListView(children: [
                buildSwitch(
                    'Glutten Free',
                    'If you want the meal Glutten free or not',
                    isGlutenFree, (newVal) {
                  setState(() {
                    isGlutenFree = newVal;
                  });
                }),
                buildSwitch(
                    'Vegan', 'Meal without use of dairy products', isVegan,
                    (newVal) {
                  setState(() {
                    isVegan = newVal;
                  });
                }),
                buildSwitch(
                    'Vegetarian', 'Meal with only vegetables ', isVegetarian,
                    (newVal) {
                  setState(() {
                    isVegetarian = newVal;
                  });
                }),
                buildSwitch(
                    'Lactose Free', 'Meal with lactose or not', isLactoseFree,
                    (newVal) {
                  setState(() {
                    isLactoseFree = newVal;
                  });
                }),
                Container(
                  width: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: ElevatedButton(
                    onPressed: () {
                      Map<String, bool> selectedFilters = {
                        'Gluten': isGlutenFree,
                        'Lactose': isLactoseFree,
                        'Vegan': isVegan,
                        'Vegetarian': isVegetarian
                      };
                      widget.applyFilters(selectedFilters);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor:
                            const Color.fromARGB(255, 21, 223, 250),
                        padding: const EdgeInsets.all(0),
                        // content: ClipRRect(
                        //   borderRadius: BorderRadius.circular(8.0),
                        //   child: BackdropFilter(
                        //     filter:
                        //         ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                        //     child:
                        content: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Text(
                            'Filters has been applied successfully',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 70, 68, 68),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ));
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(TabScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 135, 18, 231),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    child: const Text('Apply Changes'),
                  ),
                )
              ]),
            ),
          ],
        ));
  }
}
