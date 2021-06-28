import 'dart:convert';
import '../utils/constants.dart';
import '../components/navDrawer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/customAlertDialog.dart';

class AddConsumers extends StatefulWidget {
  @override
  _AddConsumersState createState() => _AddConsumersState();
}

class _AddConsumersState extends State<AddConsumers> {
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String genderController = 'Male';

  Future sendConsumersData() async {
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
        title: Text('Add Consumers'),
        actions: [
          IconButton(
            icon: Icon(Icons.visibility_sharp),
            onPressed: () =>
                Navigator.popAndPushNamed(context, '/view-consumers'),
          ),
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () => Navigator.popUntil(
              context,
              ModalRoute.withName('/consumers'),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 18.0, bottom: 10.0),
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/Customer.jpg',
                    width: 150,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 6.0, 12.0, 6.0),
                      child: TextField(
                        style: TextStyle(fontSize: 20),
                        controller: fNameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(labelText: 'First Name'),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 6.0, 20.0, 6.0),
                      child: TextField(
                        style: TextStyle(fontSize: 20),
                        controller: lNameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(labelText: 'Last Name'),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: 20,
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
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 4.0,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 6.0,
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 20),
                    controller: phoneController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: ElevatedButton(
                  onPressed: sendConsumersData,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                        Text(
                          'Add Consumers',
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
