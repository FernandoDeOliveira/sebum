import 'package:sebum/models/book.dart';
import 'package:sebum/models/user.dart';

class MockUser1{
  String name = 'Luis Fernando';
  String bios = "Se existe uma vida após a morte, ela é um tormento para quem não viveu uma vida intelectual e espiritual antes da morte: ela é somente perder tudo que se tinha";
  String phone = '987654321';
  int books_load = 12;
  int books_borrowed = 8;
  String photo = "https://firebasestorage.googleapis.com/v0/b/sebum-2cb34.appspot.com/o/users_photo_profile%2FIMG-20161008-WA0130.jpg?alt=media&token=dce73654-1b40-4310-ab86-35cdbf2fffe4";
}

class MocksUser2{
  String name = 'Fulano da Silva';
  String bios = "Sou o que sou não o que dizem";
  String phone = '987654321';
  int books_load = 12;
  int books_borrowed = 8;
  String photo = "https://firebasestorage.googleapis.com/v0/b/sebum-2cb34.appspot.com/o/users_photo_profile%2FdefautPhoto.png?alt=media&token=698d84c2-3c64-4441-ada9-3d2e0cf96764";
}

class MocksUser3{
  String name = 'Sicrano Facundes';
  String bios = "Falem bem ou falem mal, mas falem de mim";
  String phone = '987654321';
  int books_load = 12;
  int books_borrowed = 8;
  String photo = "https://firebasestorage.googleapis.com/v0/b/sebum-2cb34.appspot.com/o/users_photo_profile%2Fuser1.png?alt=media&token=715e6014-9c63-4038-a851-a0d72257141b";
}

class MocksUser4{
  String name = 'Tiririca';
  String bios = "O importante não é ganhar, é competir e vencer";
  String phone = '987654321';
  int books_load = 12;
  int books_borrowed = 8;
  String photo = "https://firebasestorage.googleapis.com/v0/b/sebum-2cb34.appspot.com/o/users_photo_profile%2Fuser2.png?alt=media&token=d35d4d96-6a07-44a3-a867-1145ba268b38";
}


class MockBook1 {
  String title = "Aristóteles";
  String author = "Danilo Marcondes";
  String ISBN = "9788537816264";
  String url_photo = "http://books.google.com/books/content?id=OKnlDQAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api";
}

class MockBook2 {
  String title = "SUMA GRAMATICAL DA LINGUA PORTUGUESA";
  String author = "CARLOS NOUGUE";
  String ISBN = "8580332036";
  String url_photo = "http://books.google.com/books/content?id=VVFhzzkwcowC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api";
}

class MockBook3 {
  String title = "O Trivium";
  String author = "Irmã Miriam Joseph";
  String ISBN = "9788580333190";
  String url_photo = "http://books.google.com/books/content?id=8NNfDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api";
}

class MockBook4 {
  String title = "Odisseia";
  String author = "Homero";
  String ISBN = "9788531612602";
  String url_photo = "http://books.google.com/books/content?id=LPKyUG4OmlsC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api";
}