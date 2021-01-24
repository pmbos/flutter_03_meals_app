import 'package:flutter/material.dart';
import 'package:flutter_03_meals_app/dummy_data.dart';
import 'package:flutter_03_meals_app/models/filters.dart';
import 'package:flutter_03_meals_app/models/meal.dart';
import 'package:flutter_03_meals_app/screens/category_meals_screen.dart';
import 'package:flutter_03_meals_app/screens/filters_screen.dart';
import 'package:flutter_03_meals_app/screens/meal_detail_screen.dart';
import 'package:flutter_03_meals_app/screens/tab_screen.dart';

import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters _filters = Filters(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  );

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _updateFilters(Filters filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS
          .where((element) => _filters.includeMeal(element))
          .toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final index = _favouriteMeals.indexWhere((element) => element.id == mealId);
    if (index >= 0)
      setState(() {
        _favouriteMeals.removeAt(index);
      });
    else
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

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
      home: TabsScreen(_favouriteMeals),
      routes: {
        CategoryMealsScreen.ROUTE: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.ROUTE: (ctx) =>
            MealDetailScreen(_toggleFavourite, _isMealFavourite),
        FiltersScreen.ROUTE: (ctx) => FiltersScreen(_filters, _updateFilters),
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
