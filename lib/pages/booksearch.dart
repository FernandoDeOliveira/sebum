import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sebum/pages/login_signup_page.dart';
import 'package:sebum/models/mocks.dart/';

class BookSearch extends StatefulWidget {
  @override
  _BookSearchState createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

Widget _buildCard(book){
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)
      ),
    child: new Container(
      child: Row (
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
          new Container(
            child: new Column(
              children: <Widget>[
                Text(book.title),
                Text(book.author),
                FlatButton.icon(
                  color: Colors.purple[200],
                  label: Text("Add"),
                  icon: Icon(Icons.check),
                  onPressed: (){

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


}