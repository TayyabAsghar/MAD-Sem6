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
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String genderController = 'Male';

  Future sendCustomersData() async {
    if (fNameController.text.isNotEmpty &&
        lNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {
      var response = await http.post(
        createApiURI,
        body: jsonEncode(
          {
            "firstName": fNameController.text,
            "lastName": lNameController.text,
            "gender": genderController,
            "email": emailController.text,
            "phone": phoneController.text
          },
        ),
      );

      var result = jsonDecode(response.body);
      print(result);

      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog.ok(
            okTitle: 'Request Sent',
            content: result['message'],
            onPressedOk: () {
              fNameController.clear();
              lNameController.clear();
              emailController.clear();
              phoneController.clear();
              Navigator.pop(context);
            },
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog.ok(
            okTitle: 'Failed',
            content: 'Kindly Fill all required fields.',
            onPressedOk: () => Navigator.pop(context),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Customer'),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/Customer.jpg',
                  width: 150,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                      controller: fNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                      controller: lNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                    ),
                  ),
                ],
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
                    child: DropdownButton<String>(
                      value: genderController,
                      isExpanded: true,
                      items: ['Male', 'Female']
                          .map(
                            (val) => DropdownMenuItem(
                              child: Text(
                                val,
                                style: TextStyle(fontSize: 20),
                              ),
                              value: val,
                            ),
                          )
                          .toList(),
                      onChanged: (String value) =>
                          setState(() => genderController = value),
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
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              Flexible(
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: sendCustomersData,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                        Text(
                          'Add Customer',
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
      ),
    );
  }
}
