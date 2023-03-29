import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/dialog/chat-popup/controller/course_popup_controller.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/model/message_model.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/view/chat_media_message_item.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/view/message_avatar.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/viewmodel/chat_view_model.dart';
import 'package:video_player/video_player.dart';

class MessageItem extends StatelessWidget {
  final ItemScrollController itemScrollController;
  final IMessage message;
  final GlobalKey messageKey;
  final Function(ChatAction)? onTap;

  const MessageItem({
    Key? key,
    this.onTap,
    required this.message,
    required this.messageKey,
    required this.itemScrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatViewModel = context.read<ChatViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (message.replyTo != null)
          GestureDetector(
            onTap: () {
              chatViewModel.scrollMessage(message.replyTo ?? message);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildMessage(message, isReply: true),
            ),
          ),
        buildMessage(message),
      ],
    );
  }

  Widget buildMessage(IMessage message, {bool isReply = false}) {
    final bool isSender = message.opponentType == OpponentType.sender;

    return Padding(
      padding: EdgeInsets.only(
        left: isReply ? 8.0 : 0,
        right: isReply ? 8.0 : 0,
        top: isReply ? 8.0 : 0,
      ),
      child: Container(
        decoration: isReply
            ? BoxDecoration(
                color: isSender && isReply
                    ? UIColor.brightGray
                    : UIColor.ultramarineBlue.withOpacity(
                        0.1,
                      ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: UIColor.black.withOpacity(0.05),
                    blurRadius: 26,
                    spreadRadius: 26,
                    offset: const Offset(0, 6),
                  ),
                ],
              )
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Space(height: 8),
            MessageAvatar(
              isReply: isReply,
              onTap: onTap,
              message: isReply ? message.replyTo ?? message : message,
            ),
            const Space(height: 4),
            if (message.text != null || isReply)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Label(
                      size: 14,
                      text: isReply ? message.replyTo?.text : message.text,
                      color: isSender && isReply
                          ? UIColor.black
                          : isSender
                              ? UIColor.white
                              : UIColor.black,
                    ),
                  ),
                  if (message.mediaUrl != null)
                    const Space(
                      height: 8,
                    ),
                ],
              ),
            if (message.mediaUrl != null || isReply)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: GestureDetector(
                  onTap: (message.mediaUrl?.isNotEmpty ?? false) && !isReply
                      ? () {
                          if (message.messageType == MessageType.image) {
                            Navigation.push(
                              RouteName.fullScreenImage,
                              arguments: isReply ? message.replyTo : message,
                            );
                          } else if (message.messageType == MessageType.video) {
                            final controller = VideoPlayerController.file(File(message.mediaUrl ?? ""));

                            controller.initialize();
                            Navigation.push(
                              RouteName.videoPlayerScreen,
                              arguments: controller,
                            );
                          }
                        }
                      : null,
                  child: ChatMediaMessageItem(
                    messageType: isReply ? message.replyTo?.messageType : message.messageType,
                    url: isReply ? message.replyTo?.thumbnailUrl ?? message.replyTo?.mediaUrl : message.thumbnailUrl ?? message.mediaUrl,
                  ),
                ),
              ),
            if (!isReply) const Space(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Label(
                  text: isReply ? message.replyTo?.time : message.time,
                  color: isSender ? UIColor.white : UIColor.black,
                  size: 10,
                ),
              ),
            ),
            const Space(height: 16),
          ],
        ),
      ),
    );
  }
}
