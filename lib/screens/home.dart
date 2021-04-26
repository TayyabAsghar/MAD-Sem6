import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/navDrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final inputController = TextEditingController();

  String _findType(input) {
    if (input < 2) return 'Neither Prime nor Composite';

    for (int i = 2; i <= input / 2; ++i)
      if (input % i == 0) return 'Composite Number';

    return 'Prime Number';
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prime or Composite'),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.0,
              child: TextField(
                controller: inputController,
                decoration: InputDecoration(
                  labelText: 'Enter the number to find it\'s type',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ], // Filters the text to digits only
              ),
            ),
            Padding(padding: EdgeInsets.all(12)),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton.icon(
                label: Text('Find'),
                icon: Icon(Icons.search),
                onPressed: () {
                  if (inputController.text.isNotEmpty) // Handle the empty input
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            _findType(
                              int.parse(inputController.text),
                            ),
                            style: TextStyle(fontSize: 20),
                          ),
                        );
                      },
                    );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
