import 'package:flutter/material.dart';
import '../components/navDrawer.dart';

class Record extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Records'),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Container(),
    );
  }
}
