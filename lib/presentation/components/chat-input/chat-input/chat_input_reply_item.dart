import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/chat-input/chat-input/chat_input_item_top.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class ChatInputReplyItem extends StatelessWidget {
  final String? replyTitle;
  final String? replySubtitle;
  final VoidCallback? onReplyTap;
  final bool? isReply;
  final String? userImage;
  const ChatInputReplyItem({
    Key? key,
    this.replyTitle,
    this.replySubtitle,
    this.onReplyTap,
    this.isReply,
    this.userImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      child: Visibility(
        visible: isReply ?? false,
        child: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.zero,
              color: UIColor.brightGray,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                horizontalTitleGap: 12,
                dense: true,
                minLeadingWidth: 0,
                leading: Container(
                  height: 48,
                  width: 4,
                  decoration: const BoxDecoration(
                    color: UIColor.ultramarineBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                title: ChatInputItemTop(
                  userImage: userImage,
                  replyTitle: replyTitle,
                  replySubtitle: replySubtitle,
                  onReplyTap: onReplyTap,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Label(
                    text: replySubtitle ?? "",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
