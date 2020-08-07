import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourite_screen.dart';

//every time it is click we have to change, it work only on one screen so the it just update between fav and cat on the screen so it has to be stateful to change it
//defaulttabcontroller this just continue the tab with the current screen so every time it is tab the flutter know how to handle the setstate already so they would change value and rebuild once it is tab
//bottomnavigatorBar
///The stateful widget that creates the bottom navigation bar needs to keep
/// track of the index of the selected [BottomNavigationBarItem] and call
/// `setState` to rebuild the bottom navigation bar with the new [currentIndex].
class TabsScreen extends StatefulWidget {
  final List<Meal> favMeal;

  TabsScreen(this.favMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {'title': "Categories", 'page': CategoriesScreen()},
      {'title': "Favorite", 'page': FavouriteScreen(widget.favMeal)}

    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( _pages[_selectedIndex]['title']),),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
//          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _selectedIndex,  // this told which tab is selected which make the seltectitemcolor change color
          selectedItemColor: Colors.white,
          unselectedItemColor: Theme.of(context).primaryColorDark,
          type: BottomNavigationBarType.shifting, // so make the background color not working
          items: [
            // by default the page of index 0 is display then the pageindex of selected tab would be work
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text("Categories"),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text("Favorites"),
            ),
          ]),
    );
  }
}
