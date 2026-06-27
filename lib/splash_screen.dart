import 'dart:async';

import 'package:calculator/homescreen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));});


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
            image: NetworkImage('https://i.pinimg.com/originals/59/dd/1a/59dd1afd79198f8958e4ef70194bdab0.jpg')),
      ),
    );
  }
}
