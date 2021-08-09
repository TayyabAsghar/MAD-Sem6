import 'dart:async';
import '../components/navDrawer.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Stream<String> clockStream() async* {
    while (true) {
      await Future<void>.delayed(Duration(seconds: 1));
      DateTime _now = DateTime.now();
      // This will be displayed on the screen as current time
      yield '${_now.hour} : ${_now.minute} : ${_now.second}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Clock'),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.query_builder,
              size: 70,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 50),
            StreamBuilder(
              stream: clockStream(),
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();
                return Text(
                  snapshot.data,
                  style: TextStyle(
                    fontSize: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                );
              },
            ),
            SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
