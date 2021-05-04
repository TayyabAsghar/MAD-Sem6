import 'package:flutter/material.dart';
import '../components/navDrawer.dart';

class Customer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Records'),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Container(),
    );
  }
}
