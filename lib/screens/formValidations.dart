import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/ui.dart';

class FormValidations extends StatefulWidget {
  @override
  _FormValidationsState createState() => _FormValidationsState();
}

class _FormValidationsState extends State<FormValidations> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white10,
        toolbarHeight: kToolbarHeight * 0.9,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 0.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sign-up to experience new ways',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: kTextFieldStyle,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: klabelStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(Icons.account_circle),
                    errorStyle: kErrorStyle,
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Please enter username'
                      : null,
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: kTextFieldStyle,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: klabelStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(Icons.email),
                    errorStyle: kErrorStyle,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter email address';
                    else if (!RegExp(
                            r'^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$')
                        .hasMatch(value.toString()))
                      return 'Please Enter a valid Email address.';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: kTextFieldStyle,
                  decoration: InputDecoration(
                    labelText: 'Mobile No.',
                    labelStyle: klabelStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(Icons.phone),
                    errorStyle: kErrorStyle,
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter Mobile Number.';
                    else if (value.toString().length != 11)
                      return 'Mobile No. must be equal to 11.';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: kTextFieldStyle,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelStyle: klabelStyle,
                    prefixIcon: Icon(Icons.lock),
                    errorStyle: kErrorStyle,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter Password';
                    else if (value.toString().length < 8)
                      return 'Password length must be greater than or equal to 8.';
                    else if (!RegExp(r'^[a-zA-Z0-9]+$')
                        .hasMatch(value.toString()))
                      return 'Password must contain only alphabets & digits.';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  child: ElevatedButton(
                    child: Text('Register'),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () => errorMessage = isChecked
                            ? ''
                            : 'Kindly accept the terms & conditions.',
                      );

                      if (_formKey.currentState.validate() && isChecked) {
                        this._formKey.currentState.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Account Created.'),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Text(
                      errorMessage,
                      style: kErrorMessageStyle,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) => setState(
                        () => isChecked = value,
                      ),
                    ),
                    Text('I accept the terms & conditions.'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
