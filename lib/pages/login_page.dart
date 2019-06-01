import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:sebum/services/authentication.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  // Initial form is login form
  FormMode _formMode = FormMode.LOGIN;
  bool _isLoading;

  bool _validateAndSave(){
    final form = _formKey.currentState;
    if (form.validate()){
      form.save();
      return true;
    }
    return false;
  }

  // Perform login
  void _validateLogin() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()){
      String userId = "";
      try{
        if (_formMode == FormMode.LOGIN){
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        }
        setState(() {
          _isLoading = false;
        });
        if (userId.length > 0 && userId != null && _formMode == FormMode.LOGIN){
          widget.onSignedIn();
        }
      }
      catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
        });
      }
    }
  }

  @override
  void initState(){
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  void _changeFromToLogin(){
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    Widget logoHero = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/img.png', height: 1500, width: 1500) ,
        ),
    );

    Widget _showCircularProgress(){
      if(_isLoading){
        return Center(child: CircularProgressIndicator());
      }return Container(height: 0.0, width: 0.0);
    }

    Widget _showErrorMessage(){
      if (_errorMessage.length > 0 && _errorMessage != null) {
        return new Text(
          _errorMessage,
          style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.bold
          ),
        );
      } else {
        return new Container(
          height: 0.0,
        );
      }
    }


    Widget emailFormField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Digite seu Email',
        icon: new Icon(Icons.email, color: Color(0xffAD57A5)),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0))
      ),
      validator: (value) => value.isEmpty ? 'Email não pode ser vazio' : null,
      onSaved: (value) => _email = value,
      );

    Widget passwordFormField = TextFormField(
      maxLines: 1,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        icon: new Icon(Icons.lock, color: Color(0xffAD57A5)),
        hintText: 'Senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) => value.isEmpty ? 'Senha não pode ser vazia' : null,
      onSaved: (value) => _password = value,
      );

    Widget loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: _validateLogin,
          color: Colors.lightBlueAccent,
          child: Text('Entrar', style: TextStyle(color: Colors.white)),
        )
    ),
  );
    
    Widget forgotLabel = FlatButton(
      child: Text(
        'Forgot password?', 
        style: TextStyle(color: Colors.black54)) , 
      onPressed: () {},
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logoHero,
            SizedBox(height: 48.0),
            emailFormField,
            _showCircularProgress(),
            SizedBox(height: 8.0),
            passwordFormField,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
          ),
      ),
      
    );
  }
}