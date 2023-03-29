import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/presentation/components/chat-input/chat-input/chat_input.dart';
import 'package:unimastery_mobile/presentation/components/chat-input/chat-input/chat_input_addition.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/view/chat_pending_message.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/view/message_list.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/viewmodel/chat_view_model.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatViewModel = context.read<ChatViewModel>();
    return GestureDetector(
      onTap: () {
        chatViewModel.closeMediaActionSheet();
      },
      child: Column(
        children: [
          MessageList(
            messages: chatViewModel.messages,
          ),
          const ChatPendingMessage(),
          const ChatInputAddition(
            fileTitle: "File",
            photoTitle: "Photo",
            videoTitle: "Video",
            // isAddition: isAddition,
          ),
          SafeArea(
            child: ChatInput(
              onTap: () {},
              onTapCamera: () {
                chatViewModel.pickMedia(pickType: ImagePickerType.camera, mediaType: MediaType.image);
              },
              onTapAdd: () {
                chatViewModel.openMediaActionSheet();
              },
              inputController: chatViewModel.inputController,
            ),
          ),
        ],
      ),
    );
  }
}
