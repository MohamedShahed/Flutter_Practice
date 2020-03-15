import 'package:flutter/material.dart';
import 'package:quizzler/quizerBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizerBrain quizerBrain=QuizerBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> icons = [];

  void checkAnswer(bool val){
    if(quizerBrain.isThereOtherQuestions()) {
      if (quizerBrain.getQuestionAnswer() == val) {
          icons.add(Icon(Icons.check, color: Colors.green,));
      }
      else {
          icons.add(Icon(Icons.close, color: Colors.red,));
      }


      quizerBrain.nextQuestion();
    }
    else
      {
      Alert(context: context, title: "Alert", desc: "No more Questions.").show();
      icons.clear();
      quizerBrain.zeroQuestionNumber();
     }

  }
  Expanded button(bool val, Color color, String name){
    return Expanded(
      child: Padding(
        padding : EdgeInsets.all(15.0),
        child: FlatButton(
          textColor: Colors.white,
          color: color,
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            setState(() {
              checkAnswer(val);

            });
          },
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizerBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        button(true, Colors.green, 'True'),
        button(false, Colors.red, 'False'),
        Row(
          children: icons,
        )
      ],
    );
  }
}
