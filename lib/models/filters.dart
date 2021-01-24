import 'package:flutter_03_meals_app/models/meal.dart';

class Filters {
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  Filters(
      {this.isGlutenFree, this.isLactoseFree, this.isVegan, this.isVegetarian});

  bool includeMeal(Meal meal) {
    if (this.isVegan && !meal.isVegan) return false;
    if (this.isLactoseFree && !meal.isLactoseFree) return false;
    if (this.isGlutenFree && !meal.isGlutenFree) return false;
    if (this.isVegetarian && !meal.isVegetarian) return false;
    return true;
  }
}
