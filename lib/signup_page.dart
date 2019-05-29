import "package:flutter/material.dart";

class SignUpPage extends StatefulWidget {
  static String tag = 'signup-page';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
 
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/img.png'),
      ),
    );

    Widget titleSection = Container(
      width: 50,
      height: 40,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 10),
      child: Text('Faça seu cadastro', style: TextStyle(color: Colors.black, fontSize: 20),)
        
    );
    

    final name = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: 'Digite seu nome',
      decoration: InputDecoration(
        hintText: 'Nome Completo',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final cpf = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: 'Digite seu CPF',
      decoration: InputDecoration(
        hintText: 'CPF',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

     final cep = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      initialValue: 'Digite seu CEP',
      decoration: InputDecoration(
        hintText: 'CEP',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );


    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'Digite seu email',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    
     final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Registrar', style: TextStyle(color: Colors.white)),
      ),
    );
    
    final existAccountLabel = FlatButton(
      child: Text(
        'Já possui cadastro?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 40.0),
            logo,
            SizedBox(height: 0.0),
            titleSection,
            name,
            SizedBox(height: 10.0),
            cpf,
            SizedBox(height: 10.0),
            cep,
            SizedBox(height: 10.0),
            email,
            SizedBox(height: 10.0),
            password,
            SizedBox(height: 10.0),
            registerButton,
            existAccountLabel
          ],
        ),
      ),
    );
  }
}