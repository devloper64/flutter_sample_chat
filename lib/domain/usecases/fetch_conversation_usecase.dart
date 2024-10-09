import '../entities/conversation.dart';
import '../repositories/conversation_repository.dart';

class FetchConversationsUseCase {
  final ConversationRepository repository;

  FetchConversationsUseCase(this.repository);

  Future<List<Conversation>> call() async {
    return await repository.getConversation();
  }
}
