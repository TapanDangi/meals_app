import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(IconData icon, String title, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.green[200],
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            height: 120,
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            child: Text(
              'Hello Tapan,\nExplore your meals',
              softWrap: true,
              style: TextStyle(
                height: 1.25,
                letterSpacing: 1,
                wordSpacing: 5,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.deepPurple[800],
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            Icons.settings,
            'Filters',
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
