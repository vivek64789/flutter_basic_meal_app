import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';

import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class BottomTabScreen extends StatefulWidget {
  final List<Meal> favoriteMealList;

  BottomTabScreen(this.favoriteMealList);
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  List<Map<String, Object>> _widgetList = [];

  @override
  initState() {
    super.initState();
    _widgetList = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {
      'page': FavoritesScreen(widget.favoriteMealList),
      'title': 'Your Favorites'
    },
  ];
  }

  int seletedTabsIndex = 0;

  void selectedTabs(int index) {
    setState(() {
      seletedTabsIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_widgetList[seletedTabsIndex]['title'].toString()),
      ),
      drawer: MainDrawer(),
      body: _widgetList[seletedTabsIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        onTap: selectedTabs,
        currentIndex: seletedTabsIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
