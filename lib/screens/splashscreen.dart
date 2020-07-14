import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lifeline/screens/login_screen.dart';
import 'bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Login(),
      )
    );
  }

  initScreen(BuildContext context) {

   return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(5, 96, 144, 1),
                  Color.fromRGBO(81, 159, 199, 1),
                ]
              ),
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/images/Lifeline.png',
                  scale: 3,
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 1.0)),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 3,
              )
            ],
          )
        ],
        
      ),
    );
  }
}
