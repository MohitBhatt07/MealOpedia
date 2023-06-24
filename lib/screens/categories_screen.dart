import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 17),
        children: dummyData.map((category) {
          return CategoryItems(
            title: category.title,
            color: category.color,
            id: category.id,
            imageAddress: category.image,
          );
        }).toList(),
      ),
    );
  }
}
