import 'package:flutter/material.dart';
import 'package:mealapp/screens/meal_details_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  void navigateToSelectedMeal(BuildContext context) {
    Navigator.pushNamed((context), MealDetailScreen.routeName, arguments: id)
        .then((result) {
    });
  }

  String get complexityValue {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityValue {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Expensive:
        return 'Expensive';

      case Affordability.Luxurious:
        return 'Luxurious';

      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToSelectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 8,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      title,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(
                20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '$duration min',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '$complexityValue',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '$affordabilityValue',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
