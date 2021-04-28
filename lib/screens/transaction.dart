import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/navDrawer.dart';
import '../components/checkBoxList.dart';
import '../components/transactionToggle.dart';
import '../components/customAlertDialog.dart';

class CustomCard extends StatefulWidget {
  CustomCard({@required this.child});

  final Widget child;

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
      child: Card(
        elevation: 10,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: widget.child,
        ),
      ),
    );
  }
}

class Transaction extends StatefulWidget {
  Transaction({Key key}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  static String _dropdownValue = 'Newest First';
  static final fromController = TextEditingController(text: '-');
  static final toController = TextEditingController(text: 'Today');

  @override
  Widget build(BuildContext context) {
    void datePicker(TextEditingController controller) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960, 1),
        lastDate: DateTime(2050, 12),
      ).then(
        (pickedDate) =>
            controller.text = DateFormat('dd-MM-yyyy').format(pickedDate),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFB0BEC5),
      appBar: AppBar(
        title: Text('Sort & Filter'),
        actions: [
          TextButton(
            child: Text(
              'CLEAR',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                    title: 'Confirmation',
                    content: 'Are you sure you want to Cancel?',
                  );
                },
              );
            },
          ),
          TextButton(
            child: Text(
              'APPLY',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                    title: 'Confirmation',
                    content: 'Are you sure you want to Apply Changes?',
                  );
                },
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sort by',
                    style: TextStyle(fontSize: 24),
                  ),
                  DropdownButton<String>(
                    value: _dropdownValue,
                    isExpanded: true,
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
                                fontSize: 18,
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
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10.0,
                    left: 12.0,
                  ),
                  child: Text(
                    'Transition Types',
                    style: TextStyle(fontSize: 24),
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
              ],
            ),
          ),
          CustomCard(
            child: CheckBoxList(
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
          ),
          CustomCard(
            child: Column(
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
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: CustomCard(
              child: Column(
                children: [
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
                          padding: EdgeInsets.only(
                            left: 22.0,
                            right: 10.0,
                          ),
                          child: TextField(
                            controller: fromController,
                            decoration: InputDecoration(
                              labelText: 'From',
                            ),
                            keyboardType: TextInputType.datetime,
                            onTap: () => datePicker(fromController),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                            right: 22.0,
                          ),
                          child: TextFormField(
                            controller: toController,
                            decoration: InputDecoration(
                              labelText: 'To',
                            ),
                            keyboardType: TextInputType.datetime,
                            onTap: () => datePicker(toController),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
