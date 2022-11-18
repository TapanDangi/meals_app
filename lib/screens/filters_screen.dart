import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    Key? key,
    required this.saveFilters,
    required this.currentFilters,
  }) : super(key: key);

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    super.initState();
  }

  SwitchListTile filterSwitch(
    bool currentValue,
    String filterTitle,
    String filterSubTitle,
    Function updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (value) => updateValue(value),
      title: Text(filterTitle),
      subtitle: Text(filterSubTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
          ),
          Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.headline6,
          ),
          Expanded(
            child: ListView(
              children: [
                filterSwitch(
                  _glutenFree,
                  'Gluten-Free',
                  'Only include Gluten-Free Meals',
                  (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  },
                ),
                filterSwitch(
                  _lactoseFree,
                  'Lactose-Free',
                  'Only include Lactose-Free Meals',
                  (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  },
                ),
                filterSwitch(
                  _vegetarian,
                  'Vegetarian',
                  'Only include Vegetarian Meals',
                  (val) {
                    setState(() {
                      _vegetarian = val;
                    });
                  },
                ),
                filterSwitch(
                  _vegan,
                  'Vegan',
                  'Only include Vegan Meals',
                  (val) {
                    setState(() {
                      _vegan = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
