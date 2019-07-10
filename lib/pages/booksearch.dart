import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sebum/models/book.dart';
import 'package:sebum/services/firestoreDB.dart';

class BookSearch extends StatefulWidget {
  BookSearch({Key key, this.userId})
      : super(key: key);

  final String userId;


  @override
  _BookSearchState createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {

  List<Book> books = List<Book>();
  List<Book> booksForDisplay = List<Book>();

  Future<List<Book>> getAllBooksFromDB () async{
    return await DB().getAllBooks();
  }

  @override
  void initState(){
    getAllBooksFromDB().then((_books){
      setState(() {
        books.addAll(_books);
        booksForDisplay = books;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO implementar appbar
      body: ListView.builder(
        itemBuilder: (context, index){
          return index == 0 ? _searchBar() : _buildCard(index -1);
        },
        itemCount: booksForDisplay.length + 1,
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Buscar..."
        ),
        onChanged: (text){
          text = text.toLowerCase();
          setState(() {
            booksForDisplay = books.where((_book) {
              var bookTitle = _book.title.toLowerCase();
              return bookTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

_buildCard(index){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)
      ),
    child: new Container(
      child: Row (
        children: <Widget>[
          new Container(
            height: 100.0,
            width: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(
                image: NetworkImage(books[index].photo_url))
              ),
          ),
          new Container(
            child: new Column(
              children: <Widget>[
                Text(books[index].title),
                Text(books[index].author),
                FlatButton.icon(
                  color: Colors.purple[200],
                  label: Text("Torna-se dono"),
                  icon: Icon(Icons.check),
                  onPressed: () async{
                    await DB().addToUserBookcase(widget.userId, books[index].id);

                  },

                )

              ],
            ),
          )
        ],
        )
    ),  

    
  );
}
 Widget _buildCardUserBooks(book){
   return Card(
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10.0)
     ),
     child: new Container(
       child: new Column(
         children: <Widget>[
           new Row(
             children: <Widget>[
               new Column(
                 children: <Widget>[
                   new Row(
                     children: <Widget>[
                       Text(book.title),
                     ],
                    ),
                    new Row(
                      children: <Widget>[
                        Text(book.author)
                      ],
                    )
                 ],
                ),
                new Column(
                  children: <Widget>[
                    new Container(
                    height: 200.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                        image: NetworkImage(book.url_photo))
                      ),
                    ),
                  ],
                )
             ],
            ),
            new Row( //fazer iteração com essa row pra aparecer os 3 primeiros usuarios do banco que possuem o livro
              children: <Widget>[
                new Container(
                  alignment: Alignment.centerLeft,
                  child: new Text("Usuario") //Nome do usuario que possui livro
                ),
                new Container(
                  alignment: Alignment.centerRight,
                  child:
                    FlatButton.icon(
                    color: Colors.purple[200],
                    label: Text("Pedir emprestado"),
                    icon: Icon(Icons.check),
                    onPressed: (){

                     },
                    )
                  )
              ],
            ),

         ],
         )
       ,)
   );
 }



}