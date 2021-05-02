import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog({@required this.title, @required this.content});

  final title;
  final content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 24.0,
      backgroundColor: Colors.white,
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: Text('No'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Yes'),
        ),
      ],
    );
  }
}
