import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_botton.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id='Registration_Screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            textField(hintText: 'Enter your email',onChanged: (value) {
              //Do something with the user input.
            },),

            SizedBox(
              height: 8.0,
            ),
            textField(hintText: 'Enter your password',onChanged: (value) {
              //Do something with the user input.
            },),
            SizedBox(
              height: 24.0,
            ),
            Button(color:Colors.blueAccent,text: Text(
              'Register',
              style: TextStyle(color: Colors.white),),onPressed: () {
              //Implement registration functionality.
            },),
          ],
        ),
      ),
    );
  }
}

class textField extends StatelessWidget {
  textField({@required this.hintText, @required this.onChanged});
  final String hintText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black
        ),
        contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
