import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sebum/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:sebum/services/authentication.dart';


class User {
  String bios;
  String photo_url;
  List<dynamic> borrowedToUsers;
  List<dynamic> borrowedBooks;
  String id;
  List<dynamic> loanedBooks;
  String phone;
  String name;
  String email;
  List<dynamic> loanedToUsers;
  List<dynamic> bookcase;

  fromMap(Map<String, dynamic> data){
    this.bios = data['bios'];
    this.photo_url = data['photo_url'];
    this.borrowedToUsers = data['borrowedToUsers'];
    this.borrowedBooks = data['borrowedBooks'];
    this.id = data['id'];
    this.loanedBooks = data['loanedBooks'];
    this.phone = data['phone'];
    this.name = data['name'];
    this.email = data['email'];
    this.loanedToUsers = data['loanedToUsers'];
    this.bookcase = data['bookcase'];
  }

}
