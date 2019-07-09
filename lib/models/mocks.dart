import 'package:sebum/models/book.dart';
import 'package:sebum/models/user.dart';

class User_mock extends User{
  String photo_url;
  String id;
  String phone;
  String name;
  String email;

  fromMap(Map<String, dynamic> data)
  {
    this.photo_url = data['photo_url'];
    this.id = data['id'];
    this.phone = data['phone'];
    this.name = data['name'];
    this.email = data['email'];
  }
}


class Book_mock extends Book{
  String title = "Aristóteles";
  String author = "Danilo Marcondes";
  String ISBN = "9788537816264";
  String url_photo = "http://books.google.com/books/content?id=OKnlDQAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api";
}

