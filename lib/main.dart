import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
          accentColor: Colors.deepPurple[900],
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RaleWay',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      //sets the initial route
      routes: {
        '/': (ctx) => const TabsScreen(),
        // '/' is is the route to home page
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => const FiltersScreen(),
      },
      //used with Navigator.pushNamed. It takes a context and returns the page to be pushed on screen with the help of a route name

      //onGenerateRoute: (settings) {
      //  print(settings.arguments);
      //},
      //onGenerateRoute is used to execute a named route which is not defined in routes table.
      //Any route not defined in routes table follow this.

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      },
      //onUnknownRoute is used as a failsafe in case no other route is followed.
      //Typically used as a error showing page
      //it is executed if onGenerateRoute isn't defined or doesn't return a valid navigation action
    );
  }
}
