import 'package:chatapp/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textEditingController = new  TextEditingController();
  final List<chat_message> _message= <chat_message>[];

  void _handleSubmitted(String text){
    _textEditingController.clear();
    chat_message message = new chat_message(
      text: text,
    );
    setState(() {
      _message.insert(0, message);
    });
  }

  Widget _textComposerWidget(){
    return new IconTheme(
        data: new IconThemeData(
              color: Colors.cyanAccent,

    ),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText:"Enter Message"),
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
              ),
          ),
          new Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
              icon: new Icon(Icons.send),
              onPressed: ()=> _handleSubmitted(_textEditingController.text),
            ),
          )
        ],
      ),
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index)=>_message[index],
            itemCount: _message.length,
          ),
        ),
        new Divider( height: 1.0,),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
