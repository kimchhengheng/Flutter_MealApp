// this the detail when each categories meal is selected display ingredient and recipt

import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import '../widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName= '/category-meals';
  final List<Meal> availablemeal;


  CategoryMealsScreen(this.availablemeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
//  we should change the value of the list here but we cannot get the value pop back the from detail screen the result from pop is going to the pushName
// so the only choice is passing the function of setstate here to handle when the result pop back from delete
  String categoryTitle;
  List<Meal> displayMeals;
  bool _loadedinit = false;
  @override
  void initState() {
    // this is called before the build but it is too early so there is no context available
    super.initState();
  }
  // this run couple time so we have to make sure it run only one time , the context is avaible , we cannot make the desire as class value since we dont accept it from the calling
  // this run when dependencies change and the setstate , this is calling before build so the other function that need the attribute can use it
  @override
  void didChangeDependencies() {
    if(!_loadedinit) {
      final routeArgs = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeals = widget.availablemeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedinit=true;
    }
    super.didChangeDependencies();
  }

// the argument is the object that calling handle
//  in the create of the class we dont care what will pass they care only the type
  void removeMeal(String id){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == id);
    });
  }
// we can filter to remove all the unwanted
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      // should change dynamic
      body: ListView.builder(
          itemBuilder: (ctx, index){
            return MealItem(
              title: displayMeals[index].title,
              affordability: displayMeals[index].affordability,
              complexity: displayMeals[index].complexity,
              duration: displayMeals[index].duration,
              imageUrl: displayMeals[index].imageUrl,
              id: displayMeals[index].id,
//              removeMeal: removeMeal,
            );
          },
          itemCount: displayMeals.length,

      )
        // should show the list of recipe
    );
  }
}
