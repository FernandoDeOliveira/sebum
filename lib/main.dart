import 'package:flutter/material.dart';
import 'package:sebum/pages/bookcase.dart';
import 'package:sebum/pages/home_page.dart';
import 'package:sebum/pages/profile_page.dart';
import 'package:sebum/pages/root_page.dart';
import 'package:sebum/services/authentication.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sebum',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
<<<<<<< lib/main.dart
      home: new ProfilePage() //new RootPage(auth: new Auth()),
=======
      home: new RootPage(auth: new Auth()) //new Bookcase() //
>>>>>>> lib/main.dart
    );
  }
}