import 'package:flutter/material.dart';
import 'customAlertDialog.dart';

class NavDrawer extends StatelessWidget {
  final _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    final _currentRoute = ModalRoute.of(context).settings.name;

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
              color: _currentRoute == '/home' ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.blue.withOpacity(.3),
          selected: _currentRoute == '/home',
          onTap: () {
            Navigator.pop(context);
            if (_currentRoute != '/home') Navigator.pushNamed(context, '/home');
          },
        ),
        ListTile(
          leading: Icon(Icons.collections),
          title: Text(
            'Image Collection',
            style: TextStyle(
              fontSize: _fontSize,
              color: _currentRoute == '/collection'
                  ? Colors.blue
                  : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.blue.withOpacity(.3),
          selected: _currentRoute == '/collection',
          onTap: () {
            Navigator.pop(context);

            if (_currentRoute != '/collection')
              Navigator.pushNamed(context, '/collection');

            //Navigator.pushReplacementNamed(context, '/collection');
          },
        ),
        ListTile(
          leading: Icon(Icons.receipt_long_outlined),
          title: Text(
            'Transaction',
            style: TextStyle(
              fontSize: _fontSize,
              color: _currentRoute == '/transaction'
                  ? Colors.blue
                  : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.blue.withOpacity(.3),
          selected: _currentRoute == '/transaction',
          onTap: () {
            Navigator.pop(context);

            if (_currentRoute != '/transaction')
              Navigator.pushNamed(context, '/transaction');
          },
        ),
        ExpansionTile(
          leading: Icon(Icons.storage),
          title: Text(
            'Records',
            style: TextStyle(
              fontSize: _fontSize,
              color: _currentRoute == '' ? Colors.blue : Colors.grey[600],
            ),
          ),
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(
                left: 32,
                right: 32,
              ),
              leading: Icon(Icons.visibility_sharp),
              title: Text(
                'View Records',
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _currentRoute == '' ? Colors.blue : Colors.grey[600],
                ),
              ),
              selectedTileColor: Colors.black.withOpacity(.5),
              selected: _currentRoute == '',
              onTap: () {},
            ),
            ListTile(
              contentPadding: EdgeInsets.only(
                left: 32,
              ),
              leading: Icon(Icons.add),
              title: Text(
                'Add Records',
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _currentRoute == '' ? Colors.blue : Colors.grey[600],
                ),
              ),
              selectedTileColor: Colors.black.withOpacity(.5),
              selected: _currentRoute == '',
              onTap: () {},
            )
          ],
        ),
        ListTile(
          enabled: false,
          leading: Icon(Icons.delete),
          title: Text(
            'Trash',
            style: TextStyle(
              fontSize: _fontSize,
              color: _currentRoute == '' ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.black.withOpacity(.5),
          selected: _currentRoute == '',
          onTap: () {},
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
              color: _currentRoute == '' ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.black.withOpacity(.5),
          selected: _currentRoute == '',
          onTap: () {},
        ),
        ListTile(
          enabled: false,
          leading: Icon(Icons.help_center),
          title: Text(
            'Help',
            style: TextStyle(
              fontSize: _fontSize,
              color: _currentRoute == '' ? Colors.blue : Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.black.withOpacity(.5),
          selected: _currentRoute == '',
          onTap: () {},
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            'Logout',
            style: TextStyle(
              fontSize: _fontSize,
              color: Colors.grey[600],
            ),
          ),
          selectedTileColor: Colors.black.withOpacity(.5),
          //selected: _currentRoute == '',
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                    title: 'Confirmation',
                    content: 'Are you sure, you wants to logout?');
              },
            );
          },
        ),
      ],
    );
  }
}
