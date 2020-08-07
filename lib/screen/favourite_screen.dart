import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meals.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;

  FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty){
      return Center(child: Text("You have no favorites yet", style: TextStyle(
        color: Theme.of(context).accentColor,
        fontSize:30,
        fontFamily: "Shadows",
        ),));
    }
    else {
      return ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            title: favouriteMeal[index].title,
            affordability: favouriteMeal[index].affordability,
            complexity: favouriteMeal[index].complexity,
            duration: favouriteMeal[index].duration,
            imageUrl: favouriteMeal[index].imageUrl,
            id: favouriteMeal[index].id,

          );
        },
        itemCount: favouriteMeal.length,
      );
    }

  }
}
