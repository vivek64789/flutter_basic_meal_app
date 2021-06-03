import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/fluter-screen';
  final saveFilters;
  Map<String, bool> currentFilters;

  FilterScreen({
    required this.saveFilters,
    required this.currentFilters,
  });
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  Widget filterSwitchTileBuilder(
      String title, String subtitle, bool value, onChangedHandler) {
    return SwitchListTile(
        activeColor: Theme.of(context).primaryColor,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChangedHandler);
  }

  @override
  void initState() {
    // _isGlutenFree = widget.currentFilters[];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Text(
              "Choose your meal types here!",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            height: 300,
            child: ListView(
              children: [
                filterSwitchTileBuilder(
                  "Gluten Free Only",
                  "Choose meals that are gluten free",
                  _isGlutenFree,
                  (bool newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                ),
                filterSwitchTileBuilder(
                  "Lactose Free Only",
                  "Choose meals that are Lactose free",
                  _isLactoseFree,
                  (bool newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                ),
                filterSwitchTileBuilder(
                  "Vegan Free Only",
                  "Choose meals that are Vegan free",
                  _isVegan,
                  (bool newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
                filterSwitchTileBuilder(
                  "Vegetarian Free Only",
                  "Choose meals that are Vegetarian free",
                  _isVegetarian,
                  (bool newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


// 178