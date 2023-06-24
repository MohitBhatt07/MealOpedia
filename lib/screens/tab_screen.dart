import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favourites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  @override
  static const routeName = '/tab-screen';
  List<Meal> favMeals = [];
  TabScreen({required this.favMeals});
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, dynamic>>? _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'MealOpedia',
      },
      {
        'page': FavouritesScreen(favList: widget.favMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          scrolledUnderElevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          shadowColor: const Color.fromARGB(255, 172, 103, 184),
          title: Text(
            _pages![_selectedPageIndex]['title'],
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          backgroundColor: const Color.fromARGB(255, 135, 18, 231),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 7, bottom: 5),
          color: const Color.fromARGB(255, 234, 208, 241),
          child: _pages![_selectedPageIndex]['page'],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //     backgroundColor: const Color.fromARGB(255, 135, 18, 231),
        //     onTap: _selectPage,
        //     selectedItemColor: Colors.orange,
        //     unselectedItemColor: const Color.fromARGB(255, 211, 208, 208),
        //     currentIndex: _selectedPageIndex,
        //     items: const [
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.home),
        //         label: 'Home',
        //       ),
        //       BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favourites')
        //     ]),

        bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              height: 60,
              indicatorColor: Colors.yellow.withOpacity(0.7),
              labelTextStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              //const Color.fromARGB(255, 156, 211, 255).withOpacity(0.3),
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 246, 198, 253),
                        blurRadius: 15,
                        spreadRadius: 15,
                        offset: Offset(3, 3))
                  ],
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 129, 51, 192),
                    Color.fromARGB(255, 156, 37, 253)
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
              child: NavigationBar(
                  // height: 60,
                  animationDuration: const Duration(seconds: 2),
                  selectedIndex: _selectedPageIndex,
                  onDestinationSelected: (currIndex) {
                    setState(() {
                      _selectedPageIndex = currIndex;
                    });
                  },
                  labelBehavior:
                      NavigationDestinationLabelBehavior.onlyShowSelected,
                  destinations: const [
                    NavigationDestination(
                        icon: Icon(
                          Icons.home,
                        ),
                        label: "Home"),
                    NavigationDestination(
                        icon: Icon(Icons.star), label: "Fabourites")
                  ]),
            )));
  }
}
