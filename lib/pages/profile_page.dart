import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sebum/models/book.dart';
import 'package:sebum/models/user.dart';
import 'package:sebum/pages/booksearch.dart';
import 'package:sebum/pages/edit_profile.dart';
import 'package:sebum/pages/requestBookPage.dart';
import 'package:sebum/services/authentication.dart';
import 'package:sebum/services/firestoreDB.dart';
import 'package:sebum/pages/message_page.dart';



import 'bookcase.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _fullName;
  final String _status = "Estudante";
  final String _bio = "Estudante de Ciência e Tecnologia na UFMA. Areas de Interesse: Programação, Política e Economia.";
  final String _userloans = "10";
  final String _loaned = "5";
  final String _score = "4.5";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
  }

  Future<User> getUserFromDB() async{
    return  DB().getUser(widget.userId);
}

  Future<List<Book>> getUserBooksFromDB() async{
    return DB().getUserBooks(widget.userId);
  }

  Widget _buildCoverImage(Size screenSize){
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cover.jpg'),
          fit: BoxFit.cover,
        ),          
      ),
    );
  }

   Widget _buildProfileImage(String photo_url) {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(photo_url),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 5.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName(String name) {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      name,
      style: _nameTextStyle,
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer(int loans, int loaned) {
    return Container(
      height: 80.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem("Emprestimos", loans.toString()),
          _buildStatItem("Emprestados", loaned.toString()),
          _buildStatItem("Pontuação", _score),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context, String bios) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child: Text(
        bios,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Entre em contato com ${_fullName},",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => print("followed"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "FOLLOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () => print("Message"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "MESSAGE",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


Widget _buildCard(book) {
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
                            image: NetworkImage(book.photo_url)
                        )
                    ),
                  ),

                ]),
            Text(
              book.title,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            Text(
              book.author,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Colors.grey
              ),
            ),
            FlatButton.icon(
              color: Colors.purple[200],
              label: Text("Pedir Emprestado"),
              icon: Icon(Icons.check),
              onPressed: (){

              },
            ),


          ],
        ),
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      color: Colors.white70
      ,
    );
  }

  Widget _buildHorizontalList(){
    return Container(
      height: 200.0,
      child: FutureBuilder(
        future: getUserBooksFromDB(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else{
          List<Book> books = snapshot.data;
          return ListView.builder (
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return _buildCard(books[index]);
            },
            itemCount:books.length,
          );}
        },
      ), // fim listview
    );
  }

_signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: new AppBar(title: new Text("Perfil")),
      
      drawer: new Drawer(
        child: FutureBuilder(
          future: getUserFromDB(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
            User user = snapshot.data;
            return  ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(user.name),
              accountEmail: new Text(user.email),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar( backgroundImage: NetworkImage(user.photo_url),
                  
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
              title: new Text("Editar Perfil"),
              trailing: new Icon(Icons.arrow_right),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile(auth: widget.auth,userId: widget.userId,  onSignedOut: widget.onSignedOut,))
                  );
              }
            ),
             new ListTile(
              title: new Text("Tornar-se dono de livro"),
              trailing: new Icon(Icons.arrow_right),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      BookSearch(userId: widget.userId))
                  );
              }
            ),
            new ListTile(
                title: new Text("Solicitações de Livro"),
                trailing: new Icon(Icons.arrow_right),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessagePage(userId: user.id))
                  );
                }
            ),
            new ListTile(
                title: new Text("Solicitar Livro"),
                trailing: new Icon(Icons.arrow_right),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RequestBookPage(userId: user.id))
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
        );}), // fim do listView
      ),
      body: new Stack(
        children: <Widget>[
          SafeArea(
              child: FutureBuilder(
                future: getUserFromDB(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.data == null){
                    return Center(child: CircularProgressIndicator());
                  } else{
                    User user = snapshot.data;
                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          _buildProfileImage(user.photo_url),
                          _buildFullName(user.name),
                          _buildSeparator(screenSize),
                          SizedBox(height: 8.0),
                          _buildHorizontalList()
                        ],
                      ),
                    );
                  }
                  },
              )
          ),
        ],
      )
    );
  }
}
