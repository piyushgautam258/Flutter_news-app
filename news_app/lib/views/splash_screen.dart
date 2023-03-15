import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:async';
import "home_screen.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds:2),(){
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Home_Screen()),
  );
    }
    );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen")
        ),
    );
  }
}