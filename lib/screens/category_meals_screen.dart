import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({Key? key, required this.availableMeals})
      : super(key: key);

  static const routeName = '/category-meals';
  //used so that you don't have to manually write the route name everywhere

  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    //extracts the arguments passed in pushNamed function
    //we don't use initState() instead of didChangeDependencies() beacuse it doesn't support ModalRoute.
    //this is because ModalRoute need a context to pass but initState is run before the build method.
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'] as String;
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
      //returns true if the meal.categories method contains the specific categoryId
    }).toList();
    //dummyMeals can be filtered using the where() method.
    //It only contains elements which satisfies the condition in anonymous function passed to where().
    super.didChangeDependencies();
  }
  //it is triggered whenever the references of the state changes.
  //means it will be called when widget belonging to the state has been fully initialised
  //it runs before the build method runs.

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
