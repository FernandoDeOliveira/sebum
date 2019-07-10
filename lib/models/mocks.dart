import 'package:sebum/models/book.dart';
import 'package:sebum/models/user.dart';

class User_mock extends User{
  String name = 'Fulano da Silva';
  String bios = "Sou o que sou não o que dizem";
  String phone = '987654321';
  int books_load = 12;
  int books_borrowed = 8;
  String photo = "https://firebasestorage.googleapis.com/v0/b/sebum-2cb34.appspot.com/o/users_photo_profile%2FdefautPhoto.png?alt=media&token=698d84c2-3c64-4441-ada9-3d2e0cf96764";
}




class Book_mock extends Book{
  String title = "Aristóteles";
  String author = "Danilo Marcondes";
  String ISBN = "9788537816264";
  String url_photo = "http://books.google.com/books/content?id=OKnlDQAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api";
}

