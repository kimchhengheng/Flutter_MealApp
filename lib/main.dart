import 'package:flutter/material.dart';
import './dummy_data.dart';
import 'models/meals.dart';
import 'screen/filter_screen.dart';
import 'screen/tab_screen.dart';

import 'screen/Meal_detail_screen.dart';
//import 'screen/categories_screen.dart';
import 'screen/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

// scalfold and material should not be together, there is some problem with the context when it check and get the parent context
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters= {
    'gluten': false,
    'lactose': false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> _availablemeal= DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];
  // we can avoid mistake by making the class so we dont have to remember what is inside the filters match the filter data or not
  void _saveFilters(Map<String, bool> filterData){
    setState(() {
      _filters= filterData;
//       returns new list that matches the condition, true in the new list false not the in the new list
//      Remove where The passed Function must have one argument and return boolean. true means the item should be removed, modify on the list calling
//  so if we use remove where it would change the value of DUMMY_MEAL also return the remove item
      _availablemeal = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree)
          return false;
        if(_filters['lactose'] && !meal.isLactoseFree)
          return false;
        if(_filters['vegan'] && !meal.isVegan)
          return false;
        if(_filters['vegetarian'] && !meal.isVegetarian)
          return false;
        return true;
      }
      ).toList();
    });
  }
// the idea is that when we press button we check if it is in fav Yes remove it, no add to fav, So we have to pass this method to where we handle the button that will pass mealId when button is click
  void _toggleFavorite(String mealId){
    final _exitingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
//    return -1 if not element in the list
    if(_exitingIndex >=0 )
    setState(() {
      _favoriteMeal.removeAt(_exitingIndex);
    });
    else{
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
//  becasue you dont pass the list of favourite meal so in order to check and handle different icon we have to check the meal in favorite or not
  bool _isMealFavorite(String id){
    return _favoriteMeal.any((meal) => meal.id == id);// return the true if one of meal id is the same and stop execute after first found, if none return false
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 224, 229, 1),
        fontFamily: "PatrickHand",
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              color: Colors.black87,
              fontFamily: "Shadows",
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            bodyText2: TextStyle(
              color: Colors.blueGrey,
            )),
//        appBarTheme:
      ),
//      every widget using scaffold is the screen

      routes: {
        '/': (ctx) =>
            TabsScreen(_favoriteMeal), // this is the route for home so it mean in home of scafold flutter gonna call / to return CategoriesScreen()
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availablemeal),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters ,_saveFilters),
      },
//      another way to deal with navigator through screen like routing in django
//    routes map like dictionary of avaible rounte when it is called what they would be called the function so when the navigator in the category item push name we know function to call
// when we dont know the route in advance we can use
// onGenerateRoute if the name route is not register in the routes , flutter calling the OnGenerate to handle the name route
//    OnGenerateRoute: (settings){
//      print(settings.argument);
//      return MaterialPageRoute(builder: (ctx) => MealDetailScreen // this create materailpagerount then build it
// onUnknownRoute  flutter fail to build a screen, if without the Route(ex page404) and Ongenerate flutter will use Onunknown to avoid throwing the error crash, at least show something on the screen
//    OnGenerateRoute: (settings){
//      print(settings.argument);
//      return MaterialPageRoute(builder: (ctx) => MealDetailScreen // this create materailpagerount then build it
    );
  }
}
