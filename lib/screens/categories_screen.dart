import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/category-screen';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView(
        children: DUMMY_CATEGORIES
            .map(
              (categoryData) => CategoryItem(
                id: categoryData.id,
                title: categoryData.title,
                color: categoryData.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
