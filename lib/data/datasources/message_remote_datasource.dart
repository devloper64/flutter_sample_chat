import 'package:graphql_flutter/graphql_flutter.dart';

import '../../domain/entities/conversation.dart';
import '../../domain/entities/message.dart';

class MessageRemoteDataSource {
  final GraphQLClient client;

  MessageRemoteDataSource({required this.client});


  Future<List<Message>> getMessages(String conversationId) async {
    const String query = """
      query MessagesConnection(\$filter: MessageFilter) {
        messagesConnection(filter: \$filter) {
          edges {
            node {
              content
              sender {
                user {
                  id
                  email
                  firstName
                  lastName
                }
              }
              conversationId
            }
          }
        }
      }
    """;

    final result = await client.query(
      QueryOptions(
        document: gql(query),
        variables: {
          "filter": {
            "conversationId": {
              "equals": conversationId,
            },
          },
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final data = result.data!['messagesConnection']['edges'];
    return List<Message>.from(
      data.map((e) => Message.fromJson(e['node'])),
    );
  }

}
