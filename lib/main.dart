import 'package:flutter/material.dart';
import 'theme/ui.dart';
import 'screens/home.dart';
import 'screens/picture.dart';
import 'screens/consumers.dart';
import 'screens/collection.dart';
import 'screens/transaction.dart';
import 'screens/addConsumers.dart';
import 'screens/viewConsumers.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/collection': (context) => Collection(),
        '/transaction': (context) => Transaction(),
        '/consumers': (context) => Consumers(),
        '/view-consumers': (context) => ViewConsumers(),
        '/add-consumers': (context) => AddConsumers(),
        '/picture': (context) => Picture(),
      },
    );
  }
}
