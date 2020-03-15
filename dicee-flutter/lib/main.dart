import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true ,
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}


class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftNumber = 1,rightNumber = 1;
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  fun();
                },
                child: Image.asset('images/dice$leftNumber.png'),

              ),
            ),
            Expanded(
              child: FlatButton(
                child: Image.asset('images/dice$rightNumber.png'),
                onPressed: () {
                 fun();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void   fun(){
    setState(() {
      leftNumber=Random().nextInt(6)+1; // from 0 to 5 and i need from 1 to 6 so that i added one
      rightNumber=Random().nextInt(6)+1;
    });

  }
}
