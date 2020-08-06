//this just show all the image and other due to category but not the recipse and ingredient
import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screen/Meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get complexityText {
    switch(complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Hard:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      default: return "Unknown";
    }
  }
  String get affordabilityText {
    switch(affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default: return "Unknown";
    }
  }
  MealItem({@required this.title,@required this.imageUrl,@required this.duration, @required this.complexity,
  @required this.affordability, @required this.id});
  // we know the id is unique so just past the id we can loop through the dummy data
  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: {
      'id': id, 'title': title
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>selectMeal(context) ,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4, // shadow
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // image cannot have the shape also without the shape the image will overlap so we cannot see the borderradius circle 15
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight : Radius.circular(15),
                    ),
                    child: Image.network(imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover, )
                ),
                // to make image have the same , this widget force a certain form
                Positioned(
                  // relative position to the image
                    right: 10,
                    bottom: 20,
                    child: Container(
                        width: 220,
                        color: Colors.black54,
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(title, style: TextStyle(fontSize: 26, color: Colors.white), softWrap: true, overflow: TextOverflow.fade, textAlign: TextAlign.center ,))),
                // softwrap if the text too long it is wrap If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
                // overflow if the text is too long textoverflow handle it, Fade the overflowing text to transparent. but without the container it take inifity width
              ],
            ),
//            if other child in the row or column the first child gonna take all the availbe width height
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Icon(Icons.work),
                  SizedBox(width: 6,),
                  Text('$duration min')
                ],),
                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Icon(Icons.attach_money),
                  SizedBox(width: 6,),
                  Text(complexityText),
                ],),
                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Icon(Icons.schedule),
                  SizedBox(width: 6,),
                  Text(affordabilityText)
                ],),
              ],),
            )
          ],
        ),
      ),
      
    );
  }


}
