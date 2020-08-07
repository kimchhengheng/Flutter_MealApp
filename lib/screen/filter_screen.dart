import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';
//we have to used switch
// the widget the one that create with constructor
class FilterScreen extends StatefulWidget {
  static String routeName = "/filter-screen";
  final Function saveFilter;

  FilterScreen(this.saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenfree=false;
  bool _vegetarian=false;
  bool _vegan=false;
  bool _lactosefree=false;

  Widget _buildSwitchListTile (String title, String description, bool currentValue, Function update) {
    return SwitchListTile(
      title: Text('$title'),
      subtitle: Text('$description'),
      value: currentValue,
      activeTrackColor: Theme.of(context).primaryColorDark,
      inactiveTrackColor: Theme.of(context).primaryColor,
      onChanged: update,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: widget.saveFilter,)
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
            ),
          ),
//          we can not add only listview since it is the child of Column so it would take infinite height, Expanded the child take the space as it can take but not infnite
          Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    "Gluten free",
                    "Only include gluten-free meals.",
                    _glutenfree,
                      // this anonymous function just structure so the onchange will be the same like before have newvalue and call set state
                      (newvalue) {
                      setState(() {
                        _glutenfree=newvalue;
                      });
                      }
                  ),
                  _buildSwitchListTile(
                      "Lactose free",
                      "Only include Lactose-free meals.",
                      _lactosefree,
                      // this anonymous function just structure so the onchange will be the same like before have newvalue and call set state
                          (newvalue) {
                        setState(() {
                          _lactosefree=newvalue;
                        });
                      }
                  ),
                  _buildSwitchListTile(
                      "Vegetarian",
                      "Only include vegetarian meals.",
                      _vegetarian,
                      // this anonymous function just structure so the onchange will be the same like before have newvalue and call set state
                          (newvalue) {
                        setState(() {
                          _vegetarian=newvalue;
                        });
                      }
                  ),
                  _buildSwitchListTile(
                      "Vegan",
                      "Only include vegan meals.",
                      _vegan,
                      // this anonymous function just structure so the onchange will be the same like before have newvalue and call set state
                          (newvalue) {
                        setState(() {
                          _vegan=newvalue;
                        });
                      }
                  )
            ],
          )
          )
        ],
      )
    );
  }
}
