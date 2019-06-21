import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sebum/models/book.dart';
import 'package:sebum/models/user.dart';

abstract class BaseFirebase{

//  Future<String> getUserName();

//  Future<void> changeUserName(String name);

  Future<void> addToUserBookcase(String userId, Book book);

  Future<User> getUser(String userId);

}

class DB implements BaseFirebase{
  final Firestore db = Firestore.instance;
  FirebaseUser user;

  Future<User> getUser(String userId) async {
    var docRef = await db.collection('users').document('s1AaKr1kluh2auQvGsqBhF91JBj2');
    var data = await docRef.get().then((document) => document.data);
    User user = User();
    print('********************************************') ;
    print(data) ;
    print('********************************************') ;
    user.fromMap(data);
    print(user.name);
    return user;
  }

  Future<void> addToUserBookcase(String userId, Book book) async {
    var data = await book.dataLikeJson();
    db.collection('users').document(
        userId).collection('bookcase').add(book.dataLikeJson());
  }

}