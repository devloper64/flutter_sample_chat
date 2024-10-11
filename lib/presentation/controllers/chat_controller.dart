import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/message_repository.dart';
import '../../domain/usecases/message_usecase.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ChatController extends GetxController {
  final MessageUseCase messageUseCase;
  final GraphQLClient graphqlClient;

  ChatController({required this.messageUseCase, required this.graphqlClient});

  RxList<Message> messages = <Message>[].obs;
  RxBool isLoading = false.obs;
  TextEditingController messageController = TextEditingController();
  StreamSubscription? messageSubscription;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchMessages(String conversationId) async {
    isLoading.value = true;
    try {
      final fetchedMessages = await messageUseCase.call(conversationId);
      messages.assignAll(fetchedMessages);
      subscribeToNewMessages();
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> subscribeToNewMessages() async {

    const String subscriptionQuery = """

        subscription MessageCreated {
  messageCreated {
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
}



    """;

    final subscription = graphqlClient.subscribe(
      SubscriptionOptions(document: gql(subscriptionQuery),),

    );


    messageSubscription = subscription.listen((result) {
      print("Subscription result: ${result.data}");
      if (!result.hasException) {

        final newMessageData = result.data?['messageCreated'];
        if (newMessageData != null) {
          final newMessage = Message(
            content: newMessageData['content'],
            senderId: newMessageData['sender']['user']['id'],
            senderEmail: newMessageData['sender']['user']['email'],
            senderFirstName: newMessageData['sender']['user']['firstName'],
            senderLastName: newMessageData['sender']['user']['lastName'],
          );
          messages.add(newMessage);
          messages.refresh();

        }
      } else {
        print('Subscription error: ${result.exception.toString()}');
      }
    });


  }

  Future<void> sendMessage(String conversationId, String receiverUserId) async {

  if(messageController.text.isNotEmpty) {
    try {
      final result = await messageUseCase.callSendMessage(
          messageController.text,
          conversationId,
          receiverUserId
      );
      if (result != null) {
        messageController.text = "";
      }
    } catch (e) {
      e.printError();
      Get.snackbar("Send Message Error", e.toString());
    }
  }
  }

  @override
  void onClose() {
    messageSubscription?.cancel();
    super.onClose();
  }
}
