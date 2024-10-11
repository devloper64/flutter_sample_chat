import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_chat_app_with_graphql/utils/pref_utils.dart';


class GraphqlCustomClient{

  static GraphQLClient init(){

    final HttpLink httpLink = HttpLink(
      'https://api-staging.qawqal.com/graphql',
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer ${PrefUtils().getAccessToken()}',
    );

    final WebSocketLink webSocketLink = WebSocketLink(
        'wss://api-staging.qawqal.com/graphql',
        subProtocol: GraphQLProtocol.graphqlTransportWs,

    );



    final Link link = authLink.concat(httpLink);

    final finalLink = Link.split((request) => request.isSubscription, webSocketLink, link);


    GraphQLClient client =
      GraphQLClient(
        link: finalLink,
        cache: GraphQLCache(),
      );


    return client;
  }
}