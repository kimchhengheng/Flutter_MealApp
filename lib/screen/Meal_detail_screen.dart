import 'package:flutter/material.dart';

import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meals-detail";
  final Function toggleFav;
  final Function isFav;


  MealDetailScreen(this.toggleFav, this.isFav);

  @override
  Widget build(BuildContext context) {
    final routearg= ModalRoute.of(context).settings.arguments as Map<String,String>;
    final mealId= routearg['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id); 
    // i think id is unique you dont have to think about firstWhere if id is not unique we should take only the first one 
    Widget buildSelectTitle(BuildContext context, String text){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(text, style: Theme.of(context).textTheme.headline6,),
      );
    }
    Widget buildContainer(Widget child) {
      return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(15)
                  ),
          height: 200,
          width: 300,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: child
      );
    }
    
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'),) ,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            height: 300,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight : Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)
              ),
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
            )
          ),
          buildSelectTitle(context, "Ingredients"),
//        without container the listview will take the infinity height so we restrict with height of container
          buildContainer( ListView.builder(
            itemBuilder: (ctx, index){
              return Card(
                  color: Theme.of(context).accentColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  )
              );
            },
            itemCount: selectedMeal.ingredients.length,
          ),
          ),
          buildSelectTitle(context, "Steps"),
          buildContainer(
            ListView.builder(
              itemBuilder: (ctx, index){
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(child: Text('# ${(index+1)}'),),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider() // draw the horizontal linef
                  ],

                );
              },
              itemCount: selectedMeal.steps.length,
            ),
          )
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        // we want to change the value of favorite
        child: Icon(isFav(mealId)? Icons.favorite: Icons.favorite_border),
          onPressed: () {
            toggleFav(mealId);
          },
//        onPressed: () {
//          Navigator.of(context).pop(mealId);
//        }, // we can comment this since hte the pop only when they call .then so it does not matter if we does not call
      ),
    );
  }
}
