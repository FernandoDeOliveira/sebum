import 'package:http/http.dart' as http;
import 'dart:convert' as convert;





class API{
  var url = "https://www.googleapis.com/books/v1/volumes?q=";
  String title;
  String author;
  String ISBN;
  String url_photo;


  Future search_for_BookInfo(String search) async {

    var response = await http.get(url + search);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var firstItem = jsonResponse['items'][0];
      var volumeInfo = firstItem['volumeInfo'];
      title = volumeInfo['title'];
      author = volumeInfo['authors'][0];
      ISBN = volumeInfo['industryIdentifiers'][0]['identifier'];
      url_photo = volumeInfo['imageLinks']['smallThumbnail'];
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  String getTitle() {
    return title;
  }

  String getAuthor() {
    return author;
  }

  String getISBN() {
    return ISBN;
  }

  String getUrl_photo() {
    return url_photo;
  }


}


