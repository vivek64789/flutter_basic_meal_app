import 'package:flutter/material.dart';

import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals-screen';
  final List<Meal> allAvailableMeals;

  CategoriesMealsScreen({required this.allAvailableMeals});

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  List<Meal> displayMealItems = [];
  String categoryTitle = "";

  @override
  void didChangeDependencies() {
    final routesArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryID = routesArgs['id'];
    categoryTitle = routesArgs['title'].toString();
    displayMealItems =widget.allAvailableMeals.where((meals) {
      return meals.categories.contains(categoryID);
    }).toList();
    super.didChangeDependencies();
  }

  void deleteItem(String id) {
    setState(
      () {
        displayMealItems.removeWhere((meal) => meal.id == id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle.toString(),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayMealItems[index].id,
            title: displayMealItems[index].title,
            imageUrl: displayMealItems[index].imageUrl,
            duration: displayMealItems[index].duration,
            complexity: displayMealItems[index].complexity,
            affordability: displayMealItems[index].affordability,
          );
        },
        itemCount: displayMealItems.length,
      ),
    );
  }
}
