import 'package:flutter/material.dart';
import 'signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sebum',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito'
      ),
      home: SignUpPage(),
    );
  }
}