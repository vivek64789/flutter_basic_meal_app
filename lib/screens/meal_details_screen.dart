import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = "/meal-detail-screen";

  final toggleFavorite;
  final isMealFavorite;

  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  void get mealDetails {}

  Widget sectionTitle({required BuildContext context, required String title}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget sectionBoxAndContent({
    required List<String> items,
    required Color color,
    required String title,
    required Color backgroundColor,
  }) {
    return Container(
      height: 200,
      width: 350,
      child: Card(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: backgroundColor,
                    child: Text(
                      "$title ${index + 1}",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(items[index]),
                ),
                Divider()
              ],
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)!.settings.arguments as String;
    final mealDetails = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text("${mealDetails.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 300,
              width: double.infinity,
              child: Image.network(
                mealDetails.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionTitle(context: context, title: "Ingredients"),
            sectionBoxAndContent(
              items: mealDetails.ingredients,
              color: Colors.black87,
              title: '',
              backgroundColor: Theme.of(context).accentColor,
            ),
            sectionTitle(context: context, title: "Steps"),
            sectionBoxAndContent(
              items: mealDetails.steps,
              color: Colors.white,
              title: '#',
              backgroundColor: Theme.of(context).primaryColor,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        onPressed: () => widget.toggleFavorite(mealID),
        child: widget.isMealFavorite(mealID)
            ? Icon(
                Icons.star,
              )
            : Icon(
                Icons.star_outline,
              ),
      ),
    );
  }
}

// 170