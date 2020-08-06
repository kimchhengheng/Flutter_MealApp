import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meals-detail";

  @override
  Widget build(BuildContext context) {
    final routearg= ModalRoute.of(context).settings.arguments as Map<String,String>;
    final mealId= routearg['id'];
    final mealTitle = routearg['title'];
    return Scaffold(
      appBar: AppBar(title: Text(mealTitle),) ,
      body: Center(child: Text( mealId)),
    );
  }
}
