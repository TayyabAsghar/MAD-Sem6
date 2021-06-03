import 'dart:math';
import '../theme/ui.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_dev_sem_6/components/navDrawer.dart';

class TabBars extends StatefulWidget {
  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBars> {
  bool rotateFirst = false;
  bool rotateSecond = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bars'),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              alignment: FractionalOffset.center,
              duration: Duration(milliseconds: 500),
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateZ((rotateFirst ? 180 : 0) / 180 * pi),
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Screen With 5 TabBars',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Icon(Icons.filter_5),
                    ],
                  ),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(20),
                ),
                onPressed: () => setState(() => rotateSecond = !rotateSecond),
              ),
              onEnd: () {
                if (rotateFirst) {
                  Navigator.pushNamed(context, '/tab-with-6bars');
                  setState(() => rotateFirst = false);
                }
              },
            ),
            SizedBox(height: 50),
            AnimatedContainer(
              alignment: FractionalOffset.center,
              duration: Duration(milliseconds: 500),
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateZ((rotateSecond ? 180 : 0) / 180 * pi),
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Screen With 6 TabBars',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Icon(Icons.filter_6),
                    ],
                  ),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(20),
                ),
                onPressed: () => setState(() => rotateFirst = !rotateFirst),
              ),
              onEnd: () {
                if (rotateSecond) {
                  Navigator.pushNamed(context, '/tab-with-5bars');
                  setState(() => rotateSecond = false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
