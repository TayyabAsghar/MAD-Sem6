import 'theme/ui.dart';
import 'screens/home.dart';
import 'screens/streamClock.dart';
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
import 'package:flutter/material.dart';
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
        '/': (_) => Home(),
        '/collection': (_) => Collection(),
        '/transaction': (_) => Transaction(),
        '/consumers': (_) => Consumers(),
        '/view-consumers': (_) => ViewConsumers(),
        '/add-consumers': (_) => AddConsumers(),
        '/picture': (_) => Picture(),
        '/form-validations': (_) => FormValidations(),
        '/tab-bars': (_) => TabBars(),
        '/tab-with-5bars': (_) => TabWith5Bars(),
        '/tab-with-6bars': (_) => TabWith6Bars(),
        '/slider': (_) => SliderWithVideoPlayer(),
        '/clock': (_) => Clock(),
      },
    );
  }
}
