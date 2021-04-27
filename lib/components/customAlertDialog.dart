import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  CustomAlertDialog({@required this.title, @required this.content});

  final title;
  final content;

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    final title = widget.title;
    final content = widget.content;
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
