class Conversation {
  final String participantId;
  final LastResponderMessage? lastResponderMessage;
  final int? unreadCount;
  final String conversationId;

  Conversation({
    required this.participantId,
    this.lastResponderMessage,
    this.unreadCount,
    required this.conversationId
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      conversationId: json['conversationId'],
      participantId: json['participantId'],
      lastResponderMessage: json['conversation']['lastResponderMessage'] != null
          ? LastResponderMessage.fromJson(json['conversation']['lastResponderMessage'])
          : null,
      unreadCount: json['conversation']['unreadCount'],
    );
  }
}
class LastResponderMessage {
  final String content;
  final Sender sender;
  final Receiver receiver;

  LastResponderMessage({
    required this.content,
    required this.sender,
    required this.receiver,
  });

  factory LastResponderMessage.fromJson(Map<String, dynamic> json) {
    return LastResponderMessage(
      content: json['content'],
      sender: Sender.fromJson(json['sender']),
      receiver: Receiver.fromJson(json['receiver']),
    );
  }
}
class Sender {
  final User user;

  Sender({required this.user});

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      user: User.fromJson(json['user']),
    );
  }
}

class  Receiver {
  final User user;

  Receiver({required this.user});

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      user: User.fromJson(json['user']),
    );
  }
}
class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
