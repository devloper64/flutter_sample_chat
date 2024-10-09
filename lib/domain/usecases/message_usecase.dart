import 'package:sample_chat_app_with_graphql/domain/entities/message.dart';
import 'package:sample_chat_app_with_graphql/domain/repositories/message_repository.dart';



class MessageUseCase {
  final MessageRepository repository;

  MessageUseCase(this.repository);

  Future<List<Message>> call(String conversationId) async {
    return await repository.getMessages(conversationId);
  }
}
