import 'package:flutter/material.dart';

import 'screen/Meal_detail_screen.dart';
import 'screen/categories_screen.dart';
import 'screen/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}
// scalfold and material should not be together, there is some problem with the context when it check and get the parent context
class MyApp extends StatelessWidget {
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
            headline6: TextStyle(color: Colors.black87 , fontFamily: "Shadows", fontSize: 25, fontWeight: FontWeight.bold, ),
            bodyText2: TextStyle(color: Colors.blueGrey,)
        ),
//        appBarTheme:
      ),
//      every widget using scaffold is the screen

      routes: {
        '/': (ctx) => CategoriesScreen(), // this is the route for home so it mean in home of scafold flutter gonna call / to return CategoriesScreen()
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
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

