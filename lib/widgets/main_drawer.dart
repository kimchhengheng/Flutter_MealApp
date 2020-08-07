import 'package:flutter/material.dart';
import '../screen/filter_screen.dart';
// import '../screen/tab_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
//        you have main and cross axis to align so container have alignment too
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text("Cooking up",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor)),
          ),
          SizedBox(
            height: 15,
          ),
          // listtime have the icon title sub tailing and tap
          ListTile(
            // can make method to avoid repeition but i want to handle the ontap differently
            // pushreplacementname so we dont increase the size of stack no back arrow too
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
            // you cannot just call TabScreen , it does not display the in the screen you have to move from the current screen to anther screen by using push
            leading: Icon(Icons.restaurant),
            title: Text("Meals"),
          ),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(FilterScreen.routeName),
            leading: Icon(Icons.settings),
            title: Text("Filter"),
          )
        ],
      ),
    );
  }
}
