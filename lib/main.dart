import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:unitConverter/screens/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      home: SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new HomeScreen(),
      title: new Text('Unit Converter',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.asset('assets/images/rulers.png'),
      backgroundColor: Colors.white,
      photoSize: 50.0,
      loaderColor: Colors.blue,
    ),
    );
  }
}
