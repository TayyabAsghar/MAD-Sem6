import 'dart:convert';
import '../utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/navDrawer.dart';

class ViewCustomers extends StatelessWidget {
  Future fetchCostumers() async {
    final response = await http.get(fetchApiURI);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Customers'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.popAndPushNamed(context, '/add-subject'),
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () =>
                Navigator.popUntil(context, ModalRoute.withName('/')),
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
                            // columnSpacing: 100,
                            columns: [
                              DataColumn(label: Text('firstName')),
                              DataColumn(label: Text('lastName')),
                              DataColumn(label: Text('email')),
                              DataColumn(label: Text('phone')),
                            ],
                            rows: filteredList
                                .map<DataRow>(
                                  (record) => DataRow(
                                    cells: [
                                      DataCell(
                                          Text(record['firstName'] ?? '___')),
                                      DataCell(
                                          Text(record['lastName'] ?? '___')),
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
