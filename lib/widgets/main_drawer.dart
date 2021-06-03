import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget listBuilder(
    BuildContext context,
    String text,
    IconData icon,
    int index,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      selectedTileColor: Theme.of(context).primaryColor,
      onTap: () => selectedHandler(context, index),
    );
  }

  final routeList = [
    '/',
    FilterScreen.routeName,
  ];

  void selectedHandler(BuildContext context, int index) {
    Navigator.of(context).pushReplacementNamed(routeList[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              "Drawer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          listBuilder(context, "Meal Categories", Icons.restaurant, 0),
          Divider(
            height: 1,
          ),
          listBuilder(context, "Filters", Icons.settings, 1),
        ],
      ),
    );
  }
}
