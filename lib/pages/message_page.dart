import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:sebum/services/authentication.dart';
import 'package:sebum/services/firestoreDB.dart';



class MessagePage extends StatefulWidget {
  MessagePage({Key key, this.userId})
      : super(key: key);

  final String userId;

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  @override
  Widget build(BuildContext context) {
    return MessageScreen(userId: widget.userId,);
  }
}

class MessageScreen extends StatefulWidget {
  MessageScreen({ this.userId});

  final String userId;


  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mensagens"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: StreamBuilder(
                  stream: DB().booksRequested(widget.userId),
                  builder: (context, snapshot){
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index){
                            List reversed = snapshot.data.documents.reversed.toList();
                            return ChatMessage(reversed[index].data);
                          }
                        );
                    }
                  },
                )),
            Divider(
            height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: TextComposer(),
            )
          ],
        ),
      ),
    );
  }
}

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;
  final _textController = TextEditingController();

  void _reset(){
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Colors.purple),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(Icons.book),
                color: Colors.purple,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage(this.data);
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              // TODO adicionar photo_url da imagem do user
              backgroundImage: NetworkImage(data['userPhoto']),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${data['userName']}, email: ${data['email']}' ,
                  style: Theme.of(context).textTheme.subhead,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text('Solicitação do livro ${data['bookTitle']}'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
