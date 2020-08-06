// this the detail when each categories meal is selected display ingredient and recipt

import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName= '/category-meals';
//  final String categoryId;
//  final String categoryTitle;
//  CategoryMealsScreen(this.categoryId, this.categoryTitle);
// we can use argument from routing

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
//    when the this was called by the route map and push we extract the argument using he modal Route
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where(
            (meal) {
              return meal.categories.contains(categoryId);// return true to keep in the list and false not include , last time removewhere
              // meal is object of class Meal the atribute of it is categories and public so we can acess the atribute which is the list
              // so we check every catergory of the meal meet the id or not and check all the Meal in the dummy
            } ).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      // should change dynamic
      body: ListView.builder(
          itemBuilder: (ctx, index){
            return MealItem(
              title: categoryMeals[index].title,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              id: categoryMeals[index].id
            );
          },
          itemCount: categoryMeals.length,

      )
        // should show the list of recipe
    );
  }


}
