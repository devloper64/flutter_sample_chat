import 'package:graphql_flutter/graphql_flutter.dart';

import '../../domain/entities/conversation.dart';

class ConversationRemoteDataSource {
  final GraphQLClient client;

  ConversationRemoteDataSource({required this.client});


  Future<List<Conversation>> getConversations() async {
    const String query = """
      query GetConversations {
        conversationParticipantsConnection {
          totalCount
          edges {
            node {
              participantId
              conversationId
              conversation {
                lastResponderMessage {
                  content
                  sender {
                    user {
                      id
                      email
                      firstName
                      lastName
                    }
                  }
                }
                unreadCount
              }
            }
          }
        }
      }
    """;
    final result = await client.query(
      QueryOptions(
        document: gql(query),
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final data = result.data!['conversationParticipantsConnection']['edges'];
    return List<Conversation>.from(data.map((e) => Conversation.fromJson(e['node'])));
  }

}
