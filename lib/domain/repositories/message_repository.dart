import '../entities/message.dart';

abstract class MessageRepository {
  Future<List<Message>> getMessages(String conversationId);
  Future<Map<String, dynamic>> sendMessage(String content,String conversationId,String receiverUserId);
}
