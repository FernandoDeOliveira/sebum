import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> signOut();


  Future<void> sendEmailVerification();


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

    String default_photo = 'https://firebasestorage.googleapis.com/v0/b/sebum-2cb34.appspot.com/o/users_photo_profile%2FdefautPhoto.png?alt=media&token=698d84c2-3c64-4441-ada9-3d2e0cf96764';

    var data = {
      'photo_url': default_photo,
      'id':user.uid,
      'phone': " ",
      'name': " "
    };

    db.collection('users').document(user.uid).setData(data);
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

}