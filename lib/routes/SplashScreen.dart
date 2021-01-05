import 'dart:async';
import 'package:flutter/material.dart';
import 'package:saviour_app/routes/Home.dart';
import 'package:saviour_app/util/SlideFadeTransition.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  _SplashScreenState() {
    Timer(const Duration(milliseconds: 2000), () {
        Navigator.of(context).pushReplacement(
          new PageRouteBuilder(
            opaque: false,
            transitionDuration: Duration(milliseconds: 1500),
            barrierDismissible:true,
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return Home();
            },
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
              return FadeTransition(
                opacity: animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                child: child,
              );
            },
          )
        );
    });
  }

  @override Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/saviour_logo.png"),
              SlideFadeTransition(child: Text("Saviour",style: TextStyle(fontSize: 50,color: Colors.grey[800]),),offset: -2,)
            ],
          ),
        ),
      ),
    );
  }
}