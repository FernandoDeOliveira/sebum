import 'package:flutter/material.dart';
import 'package:sebum/services/authentication.dart';
import 'package:sebum/pages/profile_page.dart';

class SideMenu extends StatelessWidget{
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bookcase())
                  );
              }
            ),
             new ListTile(
              title: new Text("Sair"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                _signOut();
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