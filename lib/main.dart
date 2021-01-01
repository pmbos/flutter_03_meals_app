import 'package:flutter/material.dart';
import 'package:flutter_03_meals_app/screens/category_meals_screen.dart';
import 'package:flutter_03_meals_app/screens/meal_detail_screen.dart';

import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CategoriesScreen(),
      routes: {
        CategoryMealsScreen.ROUTE: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.ROUTE: (ctx) => MealDetailScreen(),
      },
      // Is capable of handling a route that hasn't been registered
      onGenerateRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => CategoriesScreen()),
      // Last line of defense before an error is thrown when passing an unknown route.
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (ctx) => CategoriesScreen()),
    );
  }
}
