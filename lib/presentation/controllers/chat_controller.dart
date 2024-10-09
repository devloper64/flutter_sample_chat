import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/entities/message.dart';
import '../../domain/repositories/message_repository.dart';
import '../../domain/usecases/message_usecase.dart';


class ChatController extends GetxController {
  final MessageUseCase messageUseCase;

  ChatController({required this.messageUseCase});

  RxList<Message> messages = <Message>[].obs;
  RxBool isLoading = false.obs;
  TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

  }

  void fetchMessages(String conversationId) async {
    isLoading.value = true;
    try {
      final fetchedMessages = await messageUseCase.call(conversationId);
      messages.assignAll(fetchedMessages);
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void sendMessage() {
    // Logic for sending a message (use GraphQL mutation here)
  }
}
