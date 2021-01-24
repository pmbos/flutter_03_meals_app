import 'package:flutter/material.dart';
import 'package:flutter_03_meals_app/models/meal.dart';
import 'package:flutter_03_meals_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  //TODO fix this screen not updating when removing favourites.
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty)
      return Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    else
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = favouriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            affordability: meal.affordability,
            complexity: meal.complexity,
          );
        },
        itemCount: favouriteMeals.length,
      );
  }
}
