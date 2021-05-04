import 'package:flutter/material.dart';
import 'theme/ui.dart';
import 'screens/home.dart';
import 'screens/collection.dart';
import 'screens/transaction.dart';
import 'screens/consumers.dart';
import 'screens/viewConsumers.dart';
import 'screens/addConsumers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MAD - T',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/collection': (context) => Collection(),
        '/transaction': (context) => Transaction(),
        '/consumers': (context) => Consumers(),
        '/view-consumers': (context) => ViewConsumers(),
        '/add-consumers': (context) => AddConsumers(),
      },
    );
  }
}
