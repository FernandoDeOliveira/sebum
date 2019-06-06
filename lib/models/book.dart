import 'package:sebum/services/book_api.dart';

class Book {
  String title;
  String author;
  String ISBN;
  String url_photo;
  bool isAvailable;

  searchBook(String by_title) {
    API api = API();
    api.search_for_BookInfo(by_title);
    title = api.title;
    author = api.author;
    url_photo = api.url_photo;
    ISBN = api.ISBN;
  }
  data_like_json (){
    return {'title': title, 'author': author, 'url_photo': url_photo, 'ISBN': ISBN};
  }
}
