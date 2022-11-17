import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  static const routeName = '/category-meals';
  //used so that you don't have to manually write the route name everywhere

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    //extracts the arguments passed in pushNamed function
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'] as String;
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
      //returns true if the meal.categories method contains the specific categoryId
    }).toList();
    //dummyMeals can be filtered using the where() method.
    //It only contains elements which satisfies the condition in anonymous function passed to where().

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
