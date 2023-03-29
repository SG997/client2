import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:unimastery_mobile/presentation/components/dialog/chat-popup/controller/course_popup_controller.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/model/message_model.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/view/message_item.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/viewmodel/chat_view_model.dart';

class MessageList extends StatelessWidget {
  final List<IMessage> messages;
  const MessageList({
    Key? key,
    required this.messages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatViewModel = context.watch<ChatViewModel>();

    return Expanded(
      child: ScrollablePositionedList.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(top: 60),
        itemScrollController: chatViewModel.itemScrollController,
        reverse: true,
        itemCount: messages.length,
        itemBuilder: ((context, index) {
          final message = messages[messages.length - 1 - index];
          final bool isSender = message.opponentType == OpponentType.sender;
          return Dismissible(
            direction: DismissDirection.startToEnd,
            movementDuration: Duration.zero,
            dismissThresholds: const {DismissDirection.startToEnd: 0.2},
            confirmDismiss: (value) {
              chatViewModel.replyTo(message);
              return Future.value(false);
            },
            key: message.id,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 8.0,
                top: 8,
                left: isSender ? 32 : 16,
                right: isSender ? 16 : 32,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: isSender ? UIColor.ultramarineBlue : UIColor.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: UIColor.black.withOpacity(0.05),
                      blurRadius: 26,
                      spreadRadius: 26,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: MessageItem(
                  itemScrollController: chatViewModel.itemScrollController,
                  key: ValueKey(message.id),
                  messageKey: message.replyTo?.messageKey ?? GlobalKey(),
                  onTap: (value) {
                    if (value == ChatAction.reply) {
                      chatViewModel.replyTo(message);
                    } else if (value == ChatAction.delete) {
                      chatViewModel.deleteMessage(message);
                    } else if (value == ChatAction.edit) {
                      chatViewModel.editMessage(message);
                    }
                  },
                  message: message,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
