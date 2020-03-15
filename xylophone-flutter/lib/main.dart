import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int val) {
    final player = AudioCache();
    player.play('note$val.wav');
  }

  Expanded drowButton({int val, Color color}){
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(val);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              drowButton(val: 1, color: Colors.pink),
              drowButton(val:2, color:Colors.brown),
              drowButton(val:3, color:Colors.deepPurple),
              drowButton(val:4, color:Colors.amber),
              drowButton(val:5, color:Colors.teal),
              drowButton(val:6, color:Colors.blue),
              drowButton(val:7, color:Colors.red),

            ],
          ),
        ),
      ),
    );
  }
}
