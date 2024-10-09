import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_chat_app_with_graphql/theme/theme_helper.dart';

import '../../utils/pref_utils.dart';
import '../controllers/chat_list_controller.dart';
import 'chat_page.dart';

class ChatListScreen extends StatelessWidget {
  final ChatListController controller = Get.find<ChatListController>();

  @override
  Widget build(BuildContext context) {
    controller.fetchConversations();
    return Scaffold(
      appBar: AppBar(title: const Text("Chat List",style: TextStyle(color: Colors.white),),backgroundColor: appTheme.green200,actions: [
        IconButton(onPressed: (){
          PrefUtils().clearPreferencesData();
          Get.offAllNamed('/');
        }, icon: Icon(Icons.logout,color: Colors.white,))
      ],),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.conversations.isEmpty) {
          return Center(child: Text("No conversations found"));
        }
        return ListView.builder(
          itemCount: controller.conversations.length,
          itemBuilder: (context, index) {
            final conversation = controller.conversations[index];
            final lastMessage = conversation.lastResponderMessage?.content ?? 'No messages yet';
            final senderName = conversation.lastResponderMessage?.sender?.user.firstName ?? 'Unknown';

            return ListTile(
              title: Text(senderName,style: const TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(lastMessage),
              onTap: () {
                Get.to(ChatPage(), arguments: {'conversationId': conversation.conversationId});
              },
            );
          },
        );
      }),
    );
  }
}
