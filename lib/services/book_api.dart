import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:sebum/models/book.dart';





class API{
  final _url = "https://www.googleapis.com/books/v1/volumes?q=";


  Future<List<Book>> get_books(String search, {int qty_books}) async {

    var response = await http.get(_url + search);
    List<Book> books = new List<Book>();
    if (response.statusCode == 200) {
      var qty = (qty_books == null) ? 0 : qty_books;
      var jsonResponse = convert.jsonDecode(response.body);

      for (int index=0; index<qty; index++) {
        Book book = new Book();

        var firstItem = jsonResponse['items'][index];
        var volumeInfo = firstItem['volumeInfo'];
        book.title = volumeInfo['title'];
        book.author = volumeInfo['authors'][0];
        book.ISBN = volumeInfo['industryIdentifiers'][0]['identifier'];
        book.url_photo = volumeInfo['imageLinks']['smallThumbnail'];
        books.add(book);
      }
      return books;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return books;
    }
  }
}


