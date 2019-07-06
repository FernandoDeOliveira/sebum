import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sebum/models/book.dart';
import 'package:sebum/models/todo.dart';
import 'package:sebum/models/user.dart';

abstract class BaseFirebase{

//  Future<String> getUserName();

//  Future<void> changeUserName(String name);

  addToUserBookcase(String userId, String bookId);

  Future<User> getUser(String userId);

  Future<Book> getBook(String bookId);
  
  Future<List<Book>> getUserBooks(String userId);

}

class DB implements BaseFirebase{
  final Firestore db = Firestore.instance;
  FirebaseUser user;

  Future<User> getUser(String userId) async {
    var docRef = await db.collection('users').document(userId);
    var data = await docRef.get().then((document) => document.data);
    User user = User();
    user.fromMap(data);
    return user;
  }

  addToUserBookcase(String userId, String bookId) {
  db.collection('books').document(bookId).get().then(
      (book) {

         db.collection('books').
        document(bookId).setData({
           'usersOwningTheBooks': book.data['usersOwningTheBooks'] + [userId]},
             merge: true);
      }
  );

  }

  Future<Book> getBook(String bookId) async{
    var docRef = await db.collection('books').document(bookId);
    var data = await docRef.get().then((document) => document.data);
    Book book = Book();
    book.fromMap(data);
    return book;
  }
  
  Future<List<Book>> getUserBooks(String userId) async{
    List<Map<String,dynamic>> booksAsJson = List<Map<String,dynamic>>();

    var docRef = await db.collection('books')
        .where('usersOwningTheBooks', arrayContains: userId);

    await docRef.getDocuments().then(
            (docs) => docs.documents.forEach(
                (doc) =>booksAsJson.add(doc.data))
            );

    List<Book> books = List<Book>();
    for (var b in booksAsJson){
      Book book = Book();
      book.fromMap(b);
      books.add(book);
    }

    return books;
  }


}