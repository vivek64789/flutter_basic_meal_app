import 'package:flutter/material.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({
    required this.id,
    required this.title,
    required this.color,
  });

  void navigateToAnotherScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamed(CategoriesMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToAnotherScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
