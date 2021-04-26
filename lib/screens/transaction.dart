import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/navDrawer.dart';
import '../components/checkBoxList.dart';
import '../components/transactionToggle.dart';

class Transaction extends StatefulWidget {
  Transaction({Key key}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  static String _dropdownValue = 'Newest First';

  @override
  Widget build(BuildContext context) {
    final fromController = TextEditingController(text: '-');
    final toController = TextEditingController(text: 'Today');
    return Scaffold(
      appBar: AppBar(
        title: Text('Sort & Filter'),
        actions: [
          TextButton(
            child: Text(
              'CLEAR',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
          TextButton(
            child: Text(
              'APPLY',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 12.0,
                bottom: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sort by',
                    style: TextStyle(fontSize: 24),
                  ),
                  DropdownButton<String>(
                    value: _dropdownValue,
                    items: [
                      'Newest First',
                      'Oldest First',
                      'Value High-Low',
                      'Value Low-High',
                    ]
                        .map(
                          (val) => DropdownMenuItem(
                            value: val,
                            child: Text(
                              val,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (String val) => setState(
                      () => _dropdownValue = val,
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 10.0,
                left: 12.0,
              ),
              child: Text(
                'Transition Types',
                style: TextStyle(fontSize: 20),
              ),
            ),
            TransactionToggle(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/MoneyIn.png',
                      fit: BoxFit.fitWidth,
                      width: 35,
                    ),
                    Text('Money In'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/MoneyIn.png',
                      fit: BoxFit.fitWidth,
                      width: 35,
                    ),
                    Text('Money Out'),
                  ],
                ),
              ],
            ),
            CheckBoxList(
              children: [
                'Sale',
                'Credit',
                'Refund',
                'Loan',
                'Direct Material',
                'Direct labour',
                'Asset',
                'Other',
                'Over head',
              ],
            ),
            Column(
              children: [
                Text(
                  'Transaction Health',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                TransactionToggle(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.recommend,
                          color: Colors.green,
                          size: 30,
                        ),
                        Text('Good'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.thumb_down,
                          color: Colors.yellow[800],
                          size: 30,
                        ),
                        Text('Ok'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.thumb_down,
                          color: Colors.red[600],
                          size: 30,
                        ),
                        Text('Bad'),
                      ],
                    ),
                  ],
                )
              ],
            ),
            CheckBoxList(
              children: [
                'Credit',
                'Consultant Notes Only',
                'Date Range',
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 22.0, right: 10.0),
                    child: TextField(
                      controller: fromController,
                      decoration: InputDecoration(
                        labelText: 'From',
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 22.0),
                    child: TextFormField(
                      controller: toController,
                      decoration: InputDecoration(
                        labelText: 'To',
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
