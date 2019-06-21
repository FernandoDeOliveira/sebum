import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sebum/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:sebum/services/authentication.dart';


class User {
  String name;
  String email;
  int borrowed;
  String photo_url;
  String bios;
  int loads;

  fromMap(Map<String, dynamic> data){
    this.name = data['name'];
    this.email = data['email'];
    this.borrowed = data['borrowed'];
    this.photo_url = data['photo_url'];
    this.bios = data['bios'];
    this.loads = data['load'];
  }

}
