import 'package:sample_chat_app_with_graphql/data/datasources/conversation_remote_datasource.dart';
import 'package:sample_chat_app_with_graphql/domain/entities/conversation.dart';
import 'package:sample_chat_app_with_graphql/domain/entities/message.dart';
import 'package:sample_chat_app_with_graphql/domain/repositories/conversation_repository.dart';
import 'package:sample_chat_app_with_graphql/domain/repositories/message_repository.dart';

import '../datasources/message_remote_datasource.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource remoteDataSource;

  MessageRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Message>> getMessages(String conversationId) {
   return remoteDataSource.getMessages(conversationId);
  }




}
