import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sebum/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:sebum/services/authentication.dart';


class User {
  User({this.auth});
  Firestore db = Firestore.instance;
  final BaseAuth auth;
  String name;

  String getUserId(){
    return auth.getCurrentUser().toString();
  }
  Future<FirebaseUser> getUser() async {
    return auth.getCurrentUser();
  }
  add_to_bookcase(String title) {
    Book book = Book();
    book.searchBook(title);
    db.collection('users').document(getUserId()).collection('bookcase').add(book.data_like_json());
  }


}
