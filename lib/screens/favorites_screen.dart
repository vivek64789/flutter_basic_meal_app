import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMealList;

  FavoritesScreen(this.favoriteMealList);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteMealList == null ? Center(child: Text("No any Favorite, Start adding"),): ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoriteMealList[index].id,
            title: favoriteMealList[index].title,
            imageUrl: favoriteMealList[index].imageUrl,
            duration: favoriteMealList[index].duration,
            complexity: favoriteMealList[index].complexity,
            affordability: favoriteMealList[index].affordability,
          );
        },
        itemCount: favoriteMealList.length,
      ) 
    );
  }
}
