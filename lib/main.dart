import 'package:flutter/material.dart';
import 'package:mealapp/models/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/filter_screen.dart';

import '../screens/bottom_tabs_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_details_screen.dart';
// import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> allAvailableMeals = [];

  @override
  void initState() {
    allAvailableMeals = DUMMY_MEALS;
    super.initState();
  }

  void saveFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      allAvailableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meal> favoriteList = [];

  void toggleFavorite(String id) {
    int index = favoriteList.indexWhere((meal) {
      return meal.id == id;
    });

    if (index >= 0) {
      setState(() {
        favoriteList.removeAt(index);
      });
    } else {
      setState(
        () {
          favoriteList.add(
            DUMMY_MEALS.firstWhere(
              (meal) {
                return meal.id == id;
              },
            ),
          );
        },
      );
    }
  }

  bool isMealFavorite (String id){
    return favoriteList.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              headline5: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
      ),
      // home: CategoriesScreen(), // after adding the / route in home screen we
      // dont need to specify this.
      // initialRoute: '/', // initial route is where we want to load our screen
      // may be splash screen
      routes: {
        '/': (context) =>
            BottomTabScreen(favoriteList), // '/' is home default route
        CategoriesMealsScreen.routeName: (context) => CategoriesMealsScreen(
              allAvailableMeals: allAvailableMeals,
            ),
        MealDetailScreen.routeName: (context) => MealDetailScreen(toggleFavorite,isMealFavorite),
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        FilterScreen.routeName: (context) => FilterScreen(
              saveFilters: saveFilter,
              currentFilters: _filters,
            ),
      },

      onGenerateRoute: (settings) {
        // if (settings.name == "/this") {
        //   return that;
        // }

        // this works when page is generated dyamically and we have not setup the
        // routes
      },

      onUnknownRoute: (settings) {
        // this also gets settings and with that we can verify and return
        /*
        something depending on that 
        its like 404 page, 
        use case might be if two are friends and just blocked him and one 
        tries to access his profile which which routes doesnot exits to handle
        so in that case we can use this routes
        */
      },
    );
  }
}
