class Message {
  final String content;
  final String? conversationId;
  final String senderId;
  final String senderEmail;
  final String senderFirstName;
  final String senderLastName;

  Message({
    required this.content,
    this.conversationId,
    required this.senderId,
    required this.senderEmail,
    required this.senderFirstName,
    required this.senderLastName,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: json['content'],
      conversationId: json['conversationId'],
      senderId: json['sender']['user']['id'],
      senderEmail: json['sender']['user']['email'],
      senderFirstName: json['sender']['user']['firstName'],
      senderLastName: json['sender']['user']['lastName'],
    );
  }
}
