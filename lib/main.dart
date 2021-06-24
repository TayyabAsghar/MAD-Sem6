import 'package:flutter/material.dart';
import 'theme/ui.dart';
import 'screens/home.dart';
import 'screens/tabBars.dart';
import 'screens/picture.dart';
import 'screens/consumers.dart';
import 'screens/collection.dart';
import 'screens/transaction.dart';
import 'screens/addConsumers.dart';
import 'screens/tabWith5Bars.dart';
import 'screens/tabWith6Bars.dart';
import 'screens/viewConsumers.dart';
import 'screens/formValidations.dart';
import 'screens/sliderWithVideoPlayer.dart';

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
        '/form-validations': (context) => FormValidations(),
        '/tab-bars': (context) => TabBars(),
        '/tab-with-5bars': (context) => TabWith5Bars(),
        '/tab-with-6bars': (context) => TabWith6Bars(),
        '/slider': (context) => SliderWithVideoPlayer(),
      },
    );
  }
}
