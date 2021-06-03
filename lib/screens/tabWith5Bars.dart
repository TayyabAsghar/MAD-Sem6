import 'dart:math';
import '../theme/ui.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dev_sem_6/components/navDrawer.dart';

class TabWith5Bars extends StatefulWidget {
  @override
  _TabWith5BarsState createState() => _TabWith5BarsState();
}

class _TabWith5BarsState extends State<TabWith5Bars>
    with SingleTickerProviderStateMixin {
  static const _alignments = [
    Alignment.center,
    Alignment.bottomCenter,
    Alignment.centerLeft,
    Alignment.topCenter,
    Alignment.centerRight,
    Alignment.topLeft,
    Alignment.bottomLeft,
    Alignment.topRight,
    Alignment.bottomRight,
  ];
  static const _driveAlignments = [
    Alignment.center,
    Alignment.centerRight,
    Alignment.centerLeft,
  ];

  static const items = [
    'Dropdown',
    'Elevated Button',
    'Floating Action Button',
    'Icon Button',
    'Pop-up Button'
  ];

  final random = Random();
  TabController _tabController;
  int _index = 0;
  int _drive = 0;
  bool changeSize = true;
  String dropdownController = items[0];
  String popupController = items[4];

  AlignmentGeometry get _alignment => _alignments[_index];
  AlignmentGeometry get _driveAlignment => _driveAlignments[_drive % 3];

  void setAlignment() {
    int temp = random.nextInt(20) % _alignments.length;

    do {
      // To Save from same number appear together
      if (_index != temp) {
        _index = temp;
        break;
      } else
        temp = random.nextInt(20) % _alignments.length;
    } while (true);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons & Icons'),
        bottom: TabBar(
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: 'Dropdown'),
            Tab(text: 'Elevated Button'),
            Tab(text: 'Floating Action Button'),
            Tab(text: 'Icon Button'),
            Tab(text: 'Pop-up Button'),
          ],
        ),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Move to the selected Tab', style: kDropdownItemsStyle),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: DropdownButton(
                    value: dropdownController,
                    onChanged: (value) {
                      setState(() => dropdownController = value);
                      _tabController.animateTo(
                        items.indexOf(value),
                      );
                    },
                    style: kDropdownItemsStyle,
                    isExpanded: true,
                    items: items
                        .map(
                          (val) => DropdownMenuItem(
                            child: Text(val),
                            value: val,
                          ),
                        )
                        .toList(),
                    underline: Container(
                      height: 3,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: AnimatedAlign(
              alignment: _alignment,
              curve: Curves.easeInOutBack,
              duration: const Duration(seconds: 2),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('PRESS ME'),
                ),
                onPressed: () => setState(() => setAlignment()),
              ),
            ),
          ),
          Center(
            child: AnimatedContainer(
              width: changeSize ? 80 : 250,
              height: changeSize ? 80 : 250,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 1500),
              child: FloatingActionButton(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add,
                    size: changeSize ? 40 : 120,
                  ),
                ),
                onPressed: () => setState(() => changeSize = !changeSize),
              ),
            ),
          ),
          Center(
            child: AnimatedAlign(
              alignment: _driveAlignment,
              curve: Curves.easeInOutBack,
              duration: const Duration(seconds: 2),
              child: IconButton(
                splashRadius: 1,
                color: Theme.of(context).primaryColor,
                iconSize: 60,
                icon: Icon(Icons.local_shipping),
                onPressed: () => setState(() => _drive++),
              ),
              onEnd: () {
                if (_drive % 3 != 0) setState(() => _drive++);
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Move to the selected Tab', style: kDropdownItemsStyle),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: PopupMenuButton(
                    initialValue: popupController,
                    icon: Icon(
                      Icons.tab,
                      color: Theme.of(context).primaryColor,
                    ),
                    iconSize: 40,
                    onSelected: (value) => setState(
                      () {
                        popupController = value;
                        _tabController.animateTo(
                          items.indexOf(value),
                        );
                      },
                    ),
                    itemBuilder: (context) => items
                        .map(
                          (val) => PopupMenuItem(
                            child: Text(val),
                            value: val,
                          ),
                        )
                        .toList(),
                    offset: Offset(-100, 200),
                    elevation: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
