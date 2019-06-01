import 'package:flutter/material.dart';
import 'package:sebum/pages/login_page.dart';
import 'package:sebum/pages/login_signup_page.dart';
import 'package:sebum/pages/signup_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sebum',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: LoginSignUpPage(),
    );
  }
}