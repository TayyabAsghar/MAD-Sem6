import 'dart:convert';
import '../utils/constants.dart';
import '../components/navDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/customAlertDialog.dart';

class AddCustomer extends StatefulWidget {
  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final titleController = TextEditingController();

  String levelController = 'BSc';

  final theoryHrsController = TextEditingController();

  final labHrsController = TextEditingController();

  Future sendSubjectsData() async {
    if (titleController.text.length > 0 &&
        theoryHrsController.text.length > 0 &&
        labHrsController.text.length > 0) {
      var response = await http.post(createApiURI,
          body: jsonEncode({
            "title": titleController.text,
            "level": levelController,
            "theoryHours": theoryHrsController.text,
            "labHours": labHrsController.text
          }));
      var result = jsonDecode(response.body);
      print(result);
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            title: 'Request Sent',
            content: result['message'],
            // onPressed: () {
            //   titleController.clear();
            //   theoryHrsController.clear();
            //   labHrsController.clear();
            //   Navigator.pop(context);
            // },
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            title: 'Failed',
            content: 'Kindly Fill all required fields.',
            // onPressed: () => Navigator.pop(context),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Subject'),
        actions: [
          IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/view-subjects');
              }),
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              })
        ],
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Hero(
              tag: 'logo',
              child: Image(
                image: AssetImage(
                  'assets/logo.png',
                ),
                width: 150,
              ),
            ),
            Flexible(
              child: TextField(
                style: TextStyle(fontSize: 20),
                controller: titleController,
                decoration: InputDecoration(labelText: 'Subject Title'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Level:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 30,
                ),
                Flexible(
                  child: DropdownButton(
                    value: levelController,
                    items: ['Materic', 'FSc', 'BSc', 'MS', 'PhD']
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                    isExpanded: true,
                    style: TextStyle(fontSize: 20),
                    onChanged: (String value) {
                      setState(() {
                        levelController = value;
                      });
                    },
                    underline: Container(
                      height: 2,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: TextField(
                style: TextStyle(fontSize: 20),
                controller: theoryHrsController,
                decoration: InputDecoration(labelText: 'Theory Hours'),
              ),
            ),
            Flexible(
              child: TextField(
                style: TextStyle(fontSize: 20),
                controller: labHrsController,
                decoration: InputDecoration(labelText: 'Lab Hours'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: sendSubjectsData,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      Text(
                        'Add Subject',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
