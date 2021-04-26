import 'package:flutter/material.dart';
//import 'logoutAlertBox.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawer createState() => _NavDrawer();
}

class _NavDrawer extends State<NavDrawer> {
  final _fontSize = 16.0;
  static int _selectedDestination = 0;

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://source.unsplash.com/300x300/?fire,green,forest',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  'Muhammad Tayyab Asghar',
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'muhammadtayybasghar@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.calculate),
          title: Text(
            'Prime or Composite',
            style: TextStyle(
              fontSize: _fontSize,
              color: _selectedDestination == 0 ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.blue.withOpacity(.3),
          selected: _selectedDestination == 0,
          onTap: () {
            Navigator.pop(context);
            if (_selectedDestination != 0) {
              selectDestination(0);
              Navigator.pushNamed(context, '/home');
            }
          },
        ),
        ListTile(
          leading: Icon(Icons.collections),
          title: Text(
            'Image Collection',
            style: TextStyle(
              fontSize: _fontSize,
              color: _selectedDestination == 1 ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.blue.withOpacity(.3),
          selected: _selectedDestination == 1,
          onTap: () {
            Navigator.pop(context);

            if (_selectedDestination != 1) {
              selectDestination(1);
              Navigator.pushNamed(context, '/collection');
            }
            //Navigator.pushReplacementNamed(context, '/collection');
          },
        ),
        ListTile(
          leading: Icon(Icons.receipt_long_outlined),
          title: Text(
            'Transaction',
            style: TextStyle(
              fontSize: _fontSize,
              color: _selectedDestination == 2 ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.blue.withOpacity(.3),
          selected: _selectedDestination == 2,
          onTap: () {
            Navigator.pop(context);

            if (_selectedDestination != 2) {
              selectDestination(2);
              Navigator.pushNamed(context, '/transaction');
            }
          },
        ),
        ListTile(
          enabled: false,
          leading: Icon(Icons.schedule),
          title: Text(
            'Recent',
            style: TextStyle(
              fontSize: _fontSize,
              color: _selectedDestination == 3 ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.black.withOpacity(.5),
          selected: _selectedDestination == 3,
          onTap: () {
            selectDestination(3);
          },
        ),
        ListTile(
          enabled: false,
          leading: Icon(Icons.delete),
          title: Text(
            'Trash',
            style: TextStyle(
              fontSize: _fontSize,
              color: _selectedDestination == 4 ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.black.withOpacity(.5),
          selected: _selectedDestination == 4,
          onTap: () {
            selectDestination(4);
          },
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
        ListTile(
          enabled: false,
          leading: Icon(Icons.settings),
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: _fontSize,
              color: _selectedDestination == 5 ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.black.withOpacity(.5),
          selected: _selectedDestination == 5,
          onTap: () {
            selectDestination(5);
          },
        ),
        ListTile(
          enabled: false,
          leading: Icon(Icons.help_center),
          title: Text(
            'Help',
            style: TextStyle(
              fontSize: _fontSize,
              color: _selectedDestination == 6 ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.black.withOpacity(.5),
          selected: _selectedDestination == 6,
          onTap: () {
            selectDestination(6);
          },
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
        ListTile(
          enabled: false,
          leading: Icon(Icons.logout),
          title: Text(
            'Logout',
            style: TextStyle(
              fontSize: _fontSize,
              color: _selectedDestination == 7 ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.black.withOpacity(.5),
          selected: _selectedDestination == 7,
          onTap: () {
            selectDestination(7);
          },
        ),
      ],
    );
  }
}
