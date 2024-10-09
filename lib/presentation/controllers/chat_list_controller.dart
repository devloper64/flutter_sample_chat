import 'package:get/get.dart';
import '../../domain/entities/conversation.dart';
import '../../domain/usecases/fetch_conversation_usecase.dart';

class ChatListController extends GetxController {
  final FetchConversationsUseCase fetchConversationsUseCase;
  ChatListController({required this.fetchConversationsUseCase});
  var isLoading = false.obs;
  var conversations = <Conversation>[].obs; // List of conversations



  Future<void> fetchConversations() async {
    isLoading.value = true;
    try {
      final result = await fetchConversationsUseCase();
      conversations.assignAll(result); // Assign fetched conversations
    } catch (e) {
      e.printError();
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
