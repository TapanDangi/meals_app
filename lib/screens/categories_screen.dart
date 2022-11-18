import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      //Scaffold is not returned here because the Scaffold is already set by TabsScreen
      //so we can't use Scaffold because it can't control the entire screen
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.4,
        mainAxisSpacing: 40,
        crossAxisSpacing: 30,
      ),
      children: dummyCategories.map((catData) {
        return CategoryItem(
          id: catData.id,
          title: catData.title,
          color: catData.color,
        );
      }).toList(),
    );
  }
}
