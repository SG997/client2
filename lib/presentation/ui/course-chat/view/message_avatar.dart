import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/dialog/chat-popup/controller/course_popup_controller.dart';
import 'package:unimastery_mobile/presentation/components/dialog/chat-popup/view/course_popup.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/model/message_model.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/viewmodel/chat_view_model.dart';

class MessageAvatar extends StatelessWidget {
  final IMessage message;
  final bool isReply;
  final Function(ChatAction)? onTap;
  const MessageAvatar({
    Key? key,
    this.onTap,
    required this.message,
    required this.isReply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatViewModel = context.read<ChatViewModel>();
    final bool isSender = message.opponentType == OpponentType.sender;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: UIColor.lightSilver,
                backgroundImage: NetworkImage(message.avatarUrl ?? ""),
              ),
              const Space(width: 8),
              Label(
                text: message.name ?? "",
                size: 12,
                color: isSender && isReply
                    ? UIColor.black
                    : isSender
                        ? UIColor.white
                        : UIColor.black,
              ),
            ],
          ),
        ),
        if (!isReply)
          CoursePopUp(
            iconColor: isSender ? UIColor.white : UIColor.black,
            onTap: onTap,
            controller: chatViewModel.coursePopUpController,
          ),
      ],
    );
  }
}
