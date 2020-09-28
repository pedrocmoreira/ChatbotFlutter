enum ChatMessageType {
  sent,
  received
} //Aqui vai ser verificado se a mensagem foi enviada ou nao

class ChatMessage {
  final String name;
  final String text;
  final ChatMessageType type;

  ChatMessage({
    this.name,
    this.text,
    this.type = ChatMessageType.sent,
  });
}
