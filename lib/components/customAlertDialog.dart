import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog({
    @required this.title,
    @required this.content,
    @required this.onPressedYes,
    @required this.onPressedNo,
  });

  CustomAlertDialog.ok({
    @required this.okTitle,
    @required this.content,
    @required this.onPressedOk,
  });

// Using different Title for both constructors to check which one was called.

  String okTitle;
  String title;
  final String content;
  void Function() onPressedYes;
  void Function() onPressedNo;
  void Function() onPressedOk;

  @override
  Widget build(BuildContext context) {
    final ok = okTitle != null;
    return AlertDialog(
      elevation: 24.0,
      backgroundColor: Colors.white,
      title: Text(okTitle ?? title),
      content: Text(content),
      actions: [
        if (!ok)
          ElevatedButton(
            onPressed: onPressedNo,
            child: Text('No'),
          ),
        ElevatedButton(
          onPressed: ok ? onPressedOk : onPressedYes,
          child: Text(ok ? 'OK' : 'Yes'),
        ),
      ],
    );
  }
}
