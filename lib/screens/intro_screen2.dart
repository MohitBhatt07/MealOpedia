import 'package:flutter/material.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Image.asset(
            "assets/introtwo.png",
            scale: 2,
          )),
          const Text(
            'Favourites',
            style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 4,
                      offset: Offset(4, 4),
                      color: Color.fromARGB(255, 201, 196, 196))
                ],
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 252, 133, 97),
                      Color.fromARGB(255, 245, 142, 142),
                    ]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  'Mark your meals favourite \n\nSuch that you can schedule them for next time\n\nYou get the seperate page for managing your favourite meals'))
        ],
      ),
    );
  }
}
