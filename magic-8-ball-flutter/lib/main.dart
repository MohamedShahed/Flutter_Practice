import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int imageNumber=1;
  void changeMagic(){
    setState(() {
      imageNumber=Random().nextInt(5)+1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          elevation: 0.6,
        ),
        body: Center(
          child: Expanded(
            child: FlatButton(
              onPressed: (){
                changeMagic();
              },
              child: Image.asset('images/ball$imageNumber.png'),
            ),
          ),
        ),
      ),
    );
  }
}
