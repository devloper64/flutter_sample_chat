import '../entities/message.dart';

abstract class MessageRepository {
  Future<List<Message>> getMessages(String conversationId);
}
