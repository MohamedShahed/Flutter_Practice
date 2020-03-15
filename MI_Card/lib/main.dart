import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      home:Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('in the name of allah ',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),),
          backgroundColor: Colors.teal,
          centerTitle: true,
          elevation: 0.0,

        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('Images/shahed.jpg'),
            ),
            Text('Mohamed elshahed',
            style: TextStyle(
              fontFamily: 'Pacifico',
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,

            ),),
            Text('FLUTTER DEVEOLOBER',
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 20.0,
              color: Colors.teal.shade100,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,


            ),),
            SizedBox(
              height: 20.0,
              width: 150.0 ,
              child: Divider(
                color: Colors.white,

              ),
            ),
            MyCard(icon: Icons.phone, text: '+02 011 509 54177'),
            SizedBox(
              height: 10.0,
            ),
            MyCard(icon: Icons.mail, text:'m.elshahed998@gmail.com')
          ],
        )
      ),
    );
  }
}
class MyCard extends StatelessWidget {
  MyCard({this.icon, this.text});

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 30,right: 30),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.green,
        ),
        title: Text(text,
          style: TextStyle(
              fontFamily:'SourceSansPro'
          ),
        ),
      ),
    );
  }
}
