import 'package:chatbot/models/chat_message.dart';
import 'package:chatbot/widgets/chat_message_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _messageList = <ChatMessage>[];
  final _controllerText = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controllerText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Chatbot"),
        ),
        body: Column(
          children: <Widget>[
            _buildlist(),
            Divider(
              height: 1.0,
            ),
            _buildUserInput(),
          ],
        ));
  }

  //Cria a lista de mensagens
  Widget _buildList() {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        reverse: true,
        itemBuilder: (_, int index) => ChatMessageListItem(
          chatMessage: _messageList[index],
        ),
        itemCount: _messageList.length,
      ),
    );
  }

  // Envia uma mensagem com o padao a direita
  void _sendMessage({String text}) {
    _controllerText.clear();
    _addMessage(name: "Kleber Andrade", text: text, type: ChatMessageType.sent);
  }

  //Adiciona mensagem na lista
  void _addMessage({String name, String text, ChatMessageType type}) {
    var message = ChatMessage(text: text, name: name, type: type);
    setState(() {
      _messageList.insert(0, message);
    });

    if (type == ChatMessageType.sent) {
      // Envia a mensagem para o chatbot e asguarda sua resposta
      _dialogFlowRequest(query: message.text);
    }
  }

  Future _dialogFlowRequest({String query}) async {
    //Código será adicionado aqui...
  }

  //Campo para escrever a mensagem 
  Widget _buildTextField(){
    return new Flexible(
      child: new TextField(
        controller: _controllerText,
        decoration: new InputDecoration.collapsed(
          hintText: "Enviar Mensagem"
        ),
      ),
    );
  }

  //Botão para enviar mensagem
}
