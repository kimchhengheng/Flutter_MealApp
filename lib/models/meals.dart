

import 'package:flutter/material.dart';
//enum is using number to handle so calling it directly does not give the value Simple Challenging or Hard
// enum is like type of object like string or int so calling it the value is specify but cannot use as string or int
enum Complexity {
  Simple,
  Challenging,
  Hard
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious
}
class Meal{
  final String id;
  final List<String> categories; // one meal can be in one or more category
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;


  const Meal({
      @required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian });
}