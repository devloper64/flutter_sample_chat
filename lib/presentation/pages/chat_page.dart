import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_chat_app_with_graphql/utils/pref_utils.dart';
import '../controllers/chat_controller.dart';

class ChatPage extends StatelessWidget {
  final ChatController controller = Get.find();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final conversationId = Get.arguments['conversationId'];

    // Fetch messages for the current conversation
    controller.fetchMessages(conversationId);

    // Ensure ListView scrolls to the bottom after a rebuild or new message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            // List of messages
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  final isMyMessage = message.senderId == PrefUtils().getUserId();

                  return Align(
                    alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: isMyMessage ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        message.content,
                        style: TextStyle(color: isMyMessage ? Colors.white : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Chat input box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.messageController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onSubmitted: (value) {
                        controller.sendMessage();
                        _scrollToBottom(); // Auto-scroll after sending a message
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.blue),
                    onPressed: () {
                      controller.sendMessage();
                      _scrollToBottom(); // Auto-scroll after pressing the send button
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  // Helper function to scroll to the bottom
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
