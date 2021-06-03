import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/navDrawer.dart';
import '../components/checkBoxList.dart';

class TabWith6Bars extends StatefulWidget {
  @override
  _TabWith6BarsState createState() => _TabWith6BarsState();
}

class _TabWith6BarsState extends State<TabWith6Bars>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  static const tabs = [
    'Checkboxes',
    'DatePicker',
    'Radio Buttons',
    'Switch',
    'Slider',
    'TextField',
  ];

  String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String radioValue = tabs[2];
  bool isSwitched = false;
  double _sliderValue = 50;
  TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void datePicker() {
      showDatePicker(
        context: context,
        initialDate:
            selectedDate == DateFormat('yyyy-MM-dd').format(DateTime.now())
                ? DateTime.now()
                : DateFormat('yyyy-MM-dd').parse(selectedDate),
        firstDate: DateTime(1960, 1),
        lastDate: DateTime(2050, 12),
      ).then(
        (pickedDate) => setState(
          () => selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Input & Selections'),
        bottom: TabBar(
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: 'Checkboxes'),
            Tab(text: 'DatePicker'),
            Tab(text: 'Radio Buttons'),
            Tab(text: 'Switch'),
            Tab(text: 'Slider'),
            Tab(text: 'TextField'),
          ],
        ),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CheckBoxList(children: tabs),
            ),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                selectedDate,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Select Date',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onPressed: () => datePicker(),
              ),
            ],
          )),
          Center(
            child: Column(
              children: tabs
                  .map(
                    (value) => ListTile(
                      title: Text(
                        value,
                        style: TextStyle(fontSize: 20),
                      ),
                      leading: Radio(
                        value: value,
                        groupValue: radioValue,
                        onChanged: (val) => setState(
                          () => radioValue = val.toString(),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 2),
            color: isSwitched ? Colors.black : Colors.white10,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'OFF',
                    style: TextStyle(
                      color: isSwitched
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Transform.scale(
                    scale: 1.5,
                    child: Switch(
                      value: isSwitched,
                      onChanged: (value) => setState(
                        () => isSwitched = value,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'ON',
                    style: TextStyle(
                      color: isSwitched
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 10),
                  width: _sliderValue,
                  height: _sliderValue,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(height: 20),
                Text('${_sliderValue.round()} X ${_sliderValue.round()}'),
                SizedBox(height: 20),
                Slider(
                  min: 0,
                  max: 100,
                  value: _sliderValue,
                  inactiveColor: Colors.green,
                  onChanged: (value) => setState(
                    () => _sliderValue = value,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.tab),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    labelText: 'Field Input',
                  ),
                ),
              ),
            ),
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
            },
          ),
        ],
      ),
    );
  }
}
