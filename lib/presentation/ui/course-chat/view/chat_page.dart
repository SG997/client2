import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/controller/chat_input_controller.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/view/chat_body.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/viewmodel/chat_view_model.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => ChatViewModel(ChatInputController()),
        child: const ChatBody(),
      ),
    );
  }
}
