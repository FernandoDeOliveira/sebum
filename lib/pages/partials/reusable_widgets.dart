import 'package:flutter/material.dart';
import 'package:sebum/services/authentication.dart';
import 'package:sebum/pages/profile_page.dart';

class SideMenu extends StatefulWidget{
  SideMenu({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  
  
  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context){
    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Vanessa Oliveira"),
              accountEmail: new Text("vanessaoliveira2706@gmail.com"),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar( backgroundImage: AssetImage('assets/images/foto.jpeg'),
                  
                ),
              ),
            ),
             new ListTile(
              title: new Text("Meu Perfil"),
              trailing: new Icon(Icons.arrow_right),
              onTap: (){
                Navigator.pop(context);
              }
            ),
             new ListTile(
              title: new Text("Minha Estante"),
              trailing: new Icon(Icons.arrow_right),
              onTap: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Bookcase())
                //   );
              }
            ),
             new ListTile(
              title: new Text("Sair"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                // _signOut();
              }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Fechar"),
              trailing: new Icon(Icons.cancel),
              onTap: () {Navigator.pop(context);},
            ),
          ],
        ),
      );
  }
}

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