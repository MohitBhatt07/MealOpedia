import 'dart:ui';

import 'package:shopit/screens/intro_screen2.dart';
import 'package:shopit/screens/intro_screen3.dart';

import '../models/meal.dart';
import './tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_screen1.dart';
import 'intro_screen4.dart';

class IntroScreen extends StatefulWidget {
  List<Meal> favMeals = [];
  IntroScreen({required this.favMeals});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 237, 210, 243),
        child: Stack(children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            controller: _controller,
            children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                  child: IntroScreen1()),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                  child: IntroScreen2()),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                  child: IntroScreen3()),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                  child: IntroScreen4())
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(3);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                  color: Color.fromARGB(255, 134, 133, 133),
                                  offset: Offset(4, 5)),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 250, 63, 250),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white.withOpacity(0.1)),
                                      child: const Text(
                                        'skip',
                                        style: TextStyle(fontSize: 20),
                                      )))))),
                  SmoothPageIndicator(
                    effect: CustomizableEffect(
                        dotDecoration: DotDecoration(
                            borderRadius: BorderRadius.circular(20),
                            height: 13,
                            width: 15,
                            rotationAngle: 0,
                            color: const Color.fromARGB(255, 145, 143, 143)),
                        activeDotDecoration: DotDecoration(
                            height: 20,
                            width: 50,
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 88, 255, 93))),
                    count: 4,
                    controller: _controller,
                  ),
                  InkWell(
                    onTap: () {
                      if (onLastPage) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return TabScreen(favMeals: widget.favMeals);
                        }));
                      } else {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 2,
                              color: Color.fromARGB(255, 110, 107, 107),
                              offset: Offset(4, 5)),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 33, 55, 252),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withOpacity(0.1)),
                              child: (onLastPage)
                                  ? const Text(
                                      'done',
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : const Text(
                                      'next',
                                      style: TextStyle(fontSize: 20),
                                    )),
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
