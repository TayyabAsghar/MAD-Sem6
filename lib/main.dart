import 'package:flutter/material.dart';
import 'theme/ui.dart';
import 'screens/home.dart';
import 'screens/collection.dart';
import 'screens/transaction.dart';
import 'screens/customer.dart';
import 'screens/viewCustomers.dart';
import 'screens/addCustomers.dart';

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
        '/customer': (context) => Customer(),
        '/viewCustomers': (context) => ViewCustomers(),
        '/addCustomers': (context) => AddCustomer(),
      },
    );
  }
}
