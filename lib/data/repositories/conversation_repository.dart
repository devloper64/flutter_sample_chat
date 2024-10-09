import 'package:sample_chat_app_with_graphql/data/datasources/conversation_remote_datasource.dart';
import 'package:sample_chat_app_with_graphql/domain/entities/conversation.dart';
import 'package:sample_chat_app_with_graphql/domain/repositories/conversation_repository.dart';

class ConversationRepositoryImpl implements ConversationRepository {
  final ConversationRemoteDataSource remoteDataSource;

  ConversationRepositoryImpl({required this.remoteDataSource});


  @override
  Future<List<Conversation>> getConversation() {
    return remoteDataSource.getConversations();
  }
}
