import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/model/message_model.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/view/chat_media_message_item.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/viewmodel/chat_view_model.dart';

class ChatPendingMessage extends StatelessWidget {
  const ChatPendingMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatViewModel = context.watch<ChatViewModel>();
    final messageType = chatViewModel.pendingMessage?.messageType;
    final message = chatViewModel.pendingMessage;
    return chatViewModel.pendingMessage != null
        ? AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: Container(
              decoration: BoxDecoration(
                color: UIColor.white,
                boxShadow: [
                  BoxShadow(
                    color: UIColor.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: messageType == MessageType.text
                  ? buildText(chatViewModel, message)
                  : messageType == MessageType.image || messageType == MessageType.video || messageType == MessageType.file
                      ? Column(
                          children: [
                            if (message?.replyTo != null)
                              ChatMediaMessageItem(
                                messageType: message?.replyTo?.messageType,
                                needMinimizing: true,
                                title: message?.replyTo?.text,
                                url: message?.replyTo?.thumbnailUrl ?? message?.replyTo?.mediaUrl,
                              ),
                            if (message?.replyTo != null)
                              const Space(
                                height: 16,
                              ),
                            ChatMediaMessageItem(
                              messageType: messageType,
                              title: message?.text,
                              url: message?.thumbnailUrl ?? message?.mediaUrl,
                              onTapCancel: () {
                                chatViewModel.cancel();
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget buildText(ChatViewModel chatViewModel, IMessage? message) {
    if (message?.mediaUrl != null) {
      return ChatMediaMessageItem(
        title: message?.text,
        url: message?.mediaUrl,
        onTapCancel: () {
          chatViewModel.cancel();
        },
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: UIColor.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: UIColor.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Label(
              text: message?.text,
            ),
            buildCancelButton(chatViewModel),
          ],
        ),
      );
    }
  }

  Widget buildCancelButton(ChatViewModel chatViewModel) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      onPressed: () {
        chatViewModel.cancel();
      },
      icon: const Icon(Icons.close),
    );
  }
}
