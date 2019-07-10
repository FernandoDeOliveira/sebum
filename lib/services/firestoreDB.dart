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

  Future<List<Book>> getAllBooks();
  
  Future<List<Book>> getUserBooks(String userId);

  Future<void> requestBook( String userIdDest, String userIdSrc,
      String userEmailSrc, String userPhotoSrc, String bookName);

  Stream<QuerySnapshot> booksRequested(String userId);

  Future<void> uploadPhotoProfile(String userId, String photo_url);

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

  Future<List<Book>> getAllBooks() async{
    List<Map<String,dynamic>> booksAsJson = List<Map<String,dynamic>>();

    await db.collection('books').getDocuments()
        .then((books) => books.documents.forEach(
            (book) => booksAsJson.add(book.data)));

    List<Book> books = List<Book>();
    for (var b in booksAsJson){
      Book book = Book();
      book.fromMap(b);
      books.add(book);
    }

    return books;
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

  Future<void> requestBook(String userIdDest, userNameSrc,
      String userEmailSrc, String userPhotoSrc, String bookTitle) async{

    await db.collection('users').document(userIdDest)
        .collection('booksSolicitation').document()
        .setData(
        {'userName': userNameSrc,
          'bookTitle': bookTitle,
          'email': userEmailSrc,
          'userPhoto': userPhotoSrc
        }, merge: true);
  }

  Stream<QuerySnapshot> booksRequested(String userId)  {
    return db.collection('users').document(userId)
        .collection('booksSolicitation').snapshots();
  }

  Future<void> uploadPhotoProfile(String userId, String photo_url) async{
    await db.collection('users').document(userId)
        .setData({'photo_url': photo_url}, merge: true);


  }

}