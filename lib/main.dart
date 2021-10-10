//import 'package:e_commerce/screens/login.dart';
import 'package:flutter/material.dart';
import 'screens/signup.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffaf7373),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: SignUp(),
    );
  }
}

