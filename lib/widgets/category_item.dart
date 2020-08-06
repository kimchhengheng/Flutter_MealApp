// this is the blue print to return the widget of each category
// like how each categories is display as small card
import 'package:flutter/material.dart';
import '../screen/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.title, this.color, this.id);
  void  selectCategory(BuildContext context ){
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {'id': id, 'title': title});
//    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
//      return CategoryMealsScreen(id , title);}
//      // since we are in the class, every method in the class can use this attribute
////      instead of using push navigator we can using the name route like the web app,
// //the mechanism of the route is that when the on tap is calling the function is push Name so the route map is check which is calling if the route it that and passing the arguments and retried thorugh modalroute
//     ));
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {selectCategory(context);},
      // we cannot call object of class ontap accept function
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline6,textAlign: TextAlign.center,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15) // this make the edge round
        ),
      ),
    );
  }
}
