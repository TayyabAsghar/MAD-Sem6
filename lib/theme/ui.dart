import 'package:flutter/material.dart';

const primaryColor = MaterialColor(
  0xFF465A65,
  <int, Color>{
    50: Color(0xFF465A65),
    100: Color(0xFF465A65),
    200: Color(0xFF465A65),
    300: Color(0xFF465A65),
    400: Color(0xFF465A65),
    500: Color(0xFF465A65),
    600: Color(0xFF465A65),
    700: Color(0xFF465A65),
    800: Color(0xFF465A65),
    900: Color(0xFF465A65),
  },
);

// Form Styling

const kTextFieldStyle = TextStyle(fontSize: 20);
const klabelStyle = TextStyle(fontSize: 20);
const kErrorStyle = TextStyle(fontSize: 13);
const kErrorMessageStyle = TextStyle(color: Colors.red);

// Tab Bar Styling

final Icon kDrawerHeaderIcon = Icon(
  Icons.visibility,
  color: Colors.cyan[700],
  size: 30,
);
const kDropdownItemsStyle = TextStyle(fontSize: 22, color: primaryColor);
const kCheckboxListTileStyle = TextStyle(fontSize: 20);
