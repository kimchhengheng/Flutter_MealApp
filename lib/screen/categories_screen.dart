// display all the categories so the user can chose each menu,
// the display just make grid of the category item , then once each is tap calling categories screen meal
// categories screen have the list of category item(which is the class that can be tap)
// due to the routing once the category item is tapped, the category meal screen is display
// category meals screen just the list of (display ) of meal item
// meal item is the class blueprint that on it is on tapped it is display meal detailed screen
import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';
class CategoriesScreen extends StatelessWidget {

//  this would continue from the tab so it should not have app bar
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children:
          DUMMY_CATEGORIES.map( (cat) {
            return CategoryItem(cat.title,cat.color, cat.id );
          }).toList(),
          // this making all the availble list of category we should make it gesture tab
          // without tolist it is only iterable not list
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2, // child aspect mean width 3 height 2
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          // with known number of child we can use GridView.count
          // max width(cross axis) then creat many number in the row as possible
        ),

    );
  }
}
