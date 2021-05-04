import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/collection.dart';
import 'screens/transaction.dart';
import 'screens/record.dart';

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
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/collection': (context) => Collection(),
        '/transaction': (context) => Transaction(),
        '/record': (context) => Record(),
      },
    );
  }
}
