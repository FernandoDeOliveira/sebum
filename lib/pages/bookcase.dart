import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:http/http.dart' as http;
import 'package:sebum/models/book.dart';
import 'dart:convert' as convert;

import 'package:sebum/services/book_api.dart';








class Bookcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Page(),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _MyPage createState() => new _MyPage();
}

class _MyPage extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Minha Estante',
                      style: TextStyle(
                          color: Colors.purple,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    )
                  ],
                ),
              )),
          SizedBox(height: 10.0),
          GridView.count(
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            children: <Widget>[
              _buildCard('gramatica metodica', 'Napoleão mendes', "https://books.google.com/books/content?id=1u9PAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api"),
              _buildCard('livro de ouro da mitologia', 'Thomas Bulfinch',"http://books.google.com/books/content?id=wwKYjadAM5sC&printsec=frontcover&img=1&zoom=5&source=gbs_api"),
              _buildCard('sao francisco', 'Tomas de Celano',"http://books.google.com/books/content?id=5A1qDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"),
              _buildCard('didascalicon', 'Hugo de São Vitor',"http://books.google.com/books/content?id=fVBwOdVw1DoC&printsec=frontcover&img=1&zoom=5&source=gbs_api"),
              SizedBox(height: 10.0,),
              FlatButton(
                child: Text('print'),
                onPressed: getBook,
              ),
            ],
          )
        ],
      ),
    );
  }

  // APENAS PARA TESTES
  Future getBook() async {
    API api = API();
    List<Book> books;
    books = await api.fetchBooks('harrypotter', qty_books: 4);
    books.forEach((book) => print(book.title));
  }


  Widget _buildCard(String title, String author,String images) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Column(
          children: <Widget>[
            Stack(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                            image: NetworkImage(images)
                        )
                    ),
                  ),

                ]),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            Text(
              author,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Colors.grey
              ),
            ),


          ],
        ),
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      color: Colors.white70
      ,
    );
  }

}
