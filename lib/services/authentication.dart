import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sebum/models/book.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<void> addNameUser(String name);

//  Future<String> getNameUser();

  Future<FirebaseUser> getCurrentUser();

  Future<void> signOut();


  Future<void> sendEmailVerification();

  Future<void> add_to_bookcase(Book book);


  Future<bool> isEmailVerified();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore db = Firestore.instance;
  FirebaseUser user;

  Future<String> signIn(String email, String password) async {
    user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    db.collection('users').document().setData({'email': email});
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }


  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }


  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  Future<void> add_to_bookcase(Book book) async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    var data = await book.data_like_json();
    String userid = user.uid.toString();
    db.collection('users').document(
        userid).collection('bookcase').add(book.data_like_json());
  }

  Future<void> addNameUser(String name) async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    String userid = user.uid.toString();
    db.collection('users').document(
      userid).setData({'name': name});
  }

  /*Future<String> getNameUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    String userid = user.uid.toString();
    String name;
    name = db.collection('users').document(
      userid).get().then((snap) => {
      snap.do
    });
  }*/

}