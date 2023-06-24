import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/introThree.png',
            scale: 0.3,
          ),
          const Text(
            'Filters',
            style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 4,
                      offset: Offset(4, 4),
                      color: Color.fromARGB(255, 201, 196, 196))
                ],
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 252, 133, 97),
                      Color.fromARGB(255, 245, 142, 142),
                    ]),
              ),
              child: const Text(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  'Apply filters to get selected meals\n\nMultiple Filters like lactose free,glucose free and much more'))
        ],
      ),
    );
  }
}
