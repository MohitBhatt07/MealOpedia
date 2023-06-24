import 'package:flutter/material.dart';

class MyPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('About'),
      content: const Text(
          'This app is all about meals and their knowledge\n\nHow to cook a particular meal\n\nWith detailed steps and procedures\n\n and ingredients to put'),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 174, 42, 197)),
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    );
  }
}
