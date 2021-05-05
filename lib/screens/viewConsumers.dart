import 'dart:convert';
import '../utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/navDrawer.dart';

class ViewConsumers extends StatelessWidget {
  Future fetchCostumers() async {
    final response = await http.get(fetchApiURI);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    }

    // If about test URL failed you an uncomment it to see what the result will look like.

    //     final result = {
    //   {
    //     'firstName': 'Uchiha',
    //     'lastName': 'Itachi',
    //     'gender': 'Male',
    //     'email': 'itachi@blackanbu.com',
    //     'phone': '00000000000',
    //   },
    //   {
    //     'firstName': 'Talia',
    //     'lastName': 'al Ghul',
    //     'gender': 'Female',
    //     'email': 'talia@assassin.com',
    //     'phone': '00000000000',
    //   },
    //   {
    //     'firstName': 'Levi',
    //     'lastName': 'Ackerman',
    //     'gender': 'Male',
    //     'email': 'justlevi@ackerman.com',
    //     'phone': '00000000000',
    //   },
    //   {
    //     'firstName': 'Tanjiro',
    //     'lastName': 'Kamado',
    //     'gender': 'Male',
    //     'email': 'tanjiro@demonslayer.com',
    //     'phone': '00000000000',
    //   },
    //   {
    //     'firstName': 'Yuji',
    //     'lastName': 'Itadori',
    //     'gender': 'Male',
    //     'email': 'yuji@jujutsukaisen.com',
    //     'phone': '00000000000',
    //   }
    // };

    // return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Consumers'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.popAndPushNamed(context, '/add-consumers'),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/Customer.jpg',
                width: 150,
              ),
            ),
            FutureBuilder(
              future: fetchCostumers(),
              builder: (BuildContext _, AsyncSnapshot snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else {
                  List filteredList = snapshot.data
                      .where((item) => (item['email'] != ''))
                      .toList();
                  return Expanded(
                    child: ListView(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            showBottomBorder: true,
                            // columnSpacing: 40,
                            columns: [
                              DataColumn(label: Text('Name')),
                              DataColumn(label: Text('Gender')),
                              DataColumn(label: Text('Email')),
                              DataColumn(label: Text('Phone')),
                            ],
                            rows: filteredList
                                .map<DataRow>(
                                  (record) => DataRow(
                                    cells: [
                                      DataCell(Text(record['firstName'] +
                                          ' ' +
                                          record['lastName'])),
                                      DataCell(Text(record['gender'] ?? '___')),
                                      DataCell(Text(record['email'] ?? '___')),
                                      DataCell(Text(record['phone'] ?? '___')),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
