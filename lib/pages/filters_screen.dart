import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters  ';

  final dynamic saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() {
    // TODO: implement createState
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String desc, bool currentVal,
      dynamic updateVal) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(desc),
        value: currentVal,
        onChanged: updateVal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[IconButton(onPressed: () {
          final selectedFilters = {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian
          };
          widget.saveFilters(selectedFilters);
        }, icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection!',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline2,
            ),
          ),
          Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                      title: Text('Gluten-free'),
                      subtitle: Text('Only Gluten free meals!'),
                      value: _glutenFree,
                      onChanged: (newVal) {
                        setState(() {
                          _glutenFree = newVal;
                        });
                      }),
                  _buildSwitchListTile('Lactor-free',
                      'Only include lactose-free meals', _lactoseFree, (
                          newVal) {
                        setState(() {
                          _lactoseFree = newVal;
                        });
                      }),
                  _buildSwitchListTile(
                      'vegetarian', 'Only Vegetarian meals!', _vegetarian,
                          (newVal) {
                        setState(() {
                          _vegetarian = newVal;
                        });
                      }),
                  _buildSwitchListTile(
                      'Vegan', 'Only include vegan meals', _vegan,
                          (newVal) {
                        setState(() {
                          _vegan = newVal;
                        });
                      })
                ],
              ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
