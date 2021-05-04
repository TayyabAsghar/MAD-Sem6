import 'package:flutter/material.dart';
import '../components/navDrawer.dart';

class Consumers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumers Records'),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'Logo',
                child: Image.asset(
                  'assets/images/Customer.jpg',
                  width: 300,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Manage Consumers Data',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
