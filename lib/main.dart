import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample_chat_app_with_graphql/domain/usecases/message_usecase.dart';
import 'package:sample_chat_app_with_graphql/presentation/controllers/chat_controller.dart';
import 'package:sample_chat_app_with_graphql/presentation/controllers/chat_list_controller.dart';
import 'package:sample_chat_app_with_graphql/presentation/pages/chat_list_page.dart';
import 'package:sample_chat_app_with_graphql/theme/theme_helper.dart';
import 'package:sample_chat_app_with_graphql/utils/pref_utils.dart';
import 'package:sample_chat_app_with_graphql/utils/size_utils.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/datasources/conversation_remote_datasource.dart';
import 'data/datasources/message_remote_datasource.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/conversation_repository.dart';
import 'data/repositories/message_repository.dart';
import 'domain/usecases/fetch_conversation_usecase.dart';
import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/verify_otp_usecase.dart';
import 'presentation/controllers/auth_controller.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/verify_otp_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefUtils().init();
  final HttpLink httpLink = HttpLink('https://api-staging.qawqal.com/graphql');

  late Link link;

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ${PrefUtils().getAccessToken()}',
  );

   link = authLink.concat(httpLink);

  final GraphQLClient client = GraphQLClient(
    link: link,
    cache: GraphQLCache(store: InMemoryStore()),
  );

  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSource(client: client);
  final AuthRepositoryImpl authRepository = AuthRepositoryImpl(remoteDataSource: remoteDataSource);

  final ConversationRemoteDataSource remoteDataSourceConversation = ConversationRemoteDataSource(client: client);
  final ConversationRepositoryImpl conversationRepository = ConversationRepositoryImpl(remoteDataSource: remoteDataSourceConversation);


  final MessageRemoteDataSource remoteDataSourceMessage = MessageRemoteDataSource(client: client);
  final MessageRepositoryImpl messageRepository = MessageRepositoryImpl(remoteDataSource: remoteDataSourceMessage);



  Get.put(AuthController(
    loginUseCase: LoginUseCase(authRepository),
    verifyOtpUseCase: VerifyOtpUseCase(authRepository),
  ));


  Get.put(ChatListController(
      fetchConversationsUseCase: FetchConversationsUseCase(conversationRepository)
  ));

  Get.put(ChatController(
      messageUseCase: MessageUseCase(messageRepository)
  ));


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) async {

    runApp(const MyApp());
  });


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context,orientation,deviceType) {
        return GetMaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: PrefUtils().getAccessToken().isEmpty?'/login':'/chat-list',
          getPages: [
            GetPage(name: '/login', page: () => LoginPage()),
            GetPage(name: '/verify-otp', page: () => VerifyOtpPage()),
            GetPage(name: '/chat-list', page: () => ChatListScreen()),
          ],
        );
      }
    );
  }
}
