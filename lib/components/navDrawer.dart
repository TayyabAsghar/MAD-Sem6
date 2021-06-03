import 'package:flutter/material.dart';
import 'customAlertDialog.dart';

class NavDrawer extends StatelessWidget {
  final _fontSize = 16.0;
  static const consumerSubTiles = [
    '/consumers',
    '/view-consumers',
    '/add-consumers',
  ];
  static const tabSubTiles = [
    '/tab-bars',
    '/tab-with-5bars',
    '/tab-with-6bars',
  ];

  @override
  Widget build(BuildContext context) {
    final _currentRoute = ModalRoute.of(context).settings.name;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 190,
          child: DrawerHeader(
            margin: EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: FadeInImage(
                    image: NetworkImage(
                      'https://source.unsplash.com/300x300/?fire,green,forest',
                    ),
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                    placeholder:
                        AssetImage('assets/images/drawer_placeholder.jpg'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Muhammad Tayyab Asghar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
                Text(
                  'muhammadtayybasghar@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
        ),
        ListTile(
          leading: Icon(Icons.calculate),
          title: Text(
            'Prime or Composite',
            style: TextStyle(
              fontSize: _fontSize,
              color: _currentRoute == '/'
                  ? Theme.of(context).primaryColor
                  : Colors.grey[600],
            ),
          ),
          selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.3),
          selected: _currentRoute == '/',
          onTap: () => Navigator.popUntil(context, ModalRoute.withName('/')),
        ),
        ListTile(
          leading: Icon(Icons.collections),
          title: Text(
            'Image Collection',
            style: TextStyle(
              fontSize: _fontSize,
              color: _currentRoute == '/collection'
                  ? Theme.of(context).primaryColor
                  : Colors.grey[600],
            ),
          ),
          selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.3),
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
                  ? Theme.of(context).primaryColor
                  : Colors.grey[600],
            ),
          ),
          selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.3),
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
            'Consumers Records',
            style: TextStyle(
              fontSize: _fontSize,
              color: _currentRoute == '/consumers'
                  ? Theme.of(context).primaryColor
                  : Colors.grey[600],
            ),
          ),
          initiallyExpanded: consumerSubTiles.contains(_currentRoute),
          onExpansionChanged: (val) {
            Navigator.pop(context);

            if (val) Navigator.pushNamed(context, '/consumers');
          },
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(left: 32),
              leading: Icon(Icons.visibility_sharp),
              title: Text(
                'View Consumers',
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _currentRoute == '/view-consumers'
                      ? Theme.of(context).primaryColor
                      : Colors.grey[600],
                ),
              ),
              selectedTileColor:
                  Theme.of(context).primaryColor.withOpacity(0.3),
              selected: _currentRoute == '/view-consumers',
              onTap: () {
                Navigator.pop(context);

                if (_currentRoute != '/view-consumers')
                  Navigator.pushNamed(context, '/view-consumers');
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 32),
              leading: Icon(Icons.add),
              title: Text(
                'Add Consumers',
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _currentRoute == '/add-consumers'
                      ? Theme.of(context).primaryColor
                      : Colors.grey[600],
                ),
              ),
              selectedTileColor:
                  Theme.of(context).primaryColor.withOpacity(0.3),
              selected: _currentRoute == '/add-consumers',
              onTap: () {
                Navigator.pop(context);

                if (_currentRoute != '/add-consumers')
                  Navigator.pushNamed(context, '/add-consumers');
              },
            )
          ],
        ),
        ListTile(
          leading: Icon(Icons.camera_alt),
          title: Text(
            'Upload Image',
            style: TextStyle(
              fontSize: _fontSize,
              color: _currentRoute == '/picture'
                  ? Theme.of(context).primaryColor
                  : Colors.grey[600],
            ),
          ),
          selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.3),
          selected: _currentRoute == '/picture',
          onTap: () {
            Navigator.pop(context);

            if (_currentRoute != '/picture')
              Navigator.pushNamed(context, '/picture');
          },
        ),
        ListTile(
          leading: Icon(Icons.list_alt_outlined),
          title: Text(
            'Form Validations',
            style: TextStyle(
              fontSize: _fontSize,
              color: _currentRoute == '/form-validations'
                  ? Theme.of(context).primaryColor
                  : Colors.grey[600],
            ),
          ),
          selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.3),
          selected: _currentRoute == '/form-validations',
          onTap: () {
            Navigator.pop(context);

            if (_currentRoute != '/form-validations')
              Navigator.pushNamed(context, '/form-validations');
          },
        ),
        ExpansionTile(
          leading: Icon(Icons.horizontal_split),
          title: Text(
            'Tab Bars',
            style: TextStyle(
              fontSize: _fontSize,
              color: _currentRoute == '/tab-bars'
                  ? Theme.of(context).primaryColor
                  : Colors.grey[600],
            ),
          ),
          initiallyExpanded: tabSubTiles.contains(_currentRoute),
          onExpansionChanged: (val) {
            Navigator.pop(context);

            if (val) Navigator.pushNamed(context, '/tab-bars');
          },
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(left: 32),
              leading: Icon(Icons.filter_5),
              title: Text(
                '5 Tab Bars',
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _currentRoute == '/tab-with-5bars'
                      ? Theme.of(context).primaryColor
                      : Colors.grey[600],
                ),
              ),
              selectedTileColor:
                  Theme.of(context).primaryColor.withOpacity(0.3),
              selected: _currentRoute == '/tab-with-5bars',
              onTap: () {
                Navigator.pop(context);

                if (_currentRoute != '/tab-with-5bars')
                  Navigator.pushNamed(context, '/tab-with-5bars');
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 32),
              leading: Icon(Icons.filter_6),
              title: Text(
                '6 Tab Bars',
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _currentRoute == '/tab-with-6bars'
                      ? Theme.of(context).primaryColor
                      : Colors.grey[600],
                ),
              ),
              selectedTileColor:
                  Theme.of(context).primaryColor.withOpacity(0.3),
              selected: _currentRoute == '/tab-with-6bars',
              onTap: () {
                Navigator.pop(context);

                if (_currentRoute != '/tab-with-6bars')
                  Navigator.pushNamed(context, '/tab-with-6bars');
              },
            )
          ],
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
              color: _currentRoute == ''
                  ? Theme.of(context).primaryColor
                  : Colors.grey[600],
            ),
          ),
          selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.3),
          //selected: _currentRoute == '',
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return CustomAlertDialog(
                  title: 'Confirmation',
                  content: 'Are you sure, you wants to logout?',
                  onPressedYes: () => Navigator.pop(context),
                  onPressedNo: () => Navigator.pop(context),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
