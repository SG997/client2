import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class ChatInputItemTop extends StatelessWidget {
  final String? replyTitle;
  final String? replySubtitle;
  final VoidCallback? onReplyTap;
  final String? userImage;
  const ChatInputItemTop({
    Key? key,
    this.replyTitle,
    this.replySubtitle,
    this.onReplyTap,
    this.userImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: UIColor.ultramarineBlue,
              backgroundImage: NetworkImage(userImage ?? ""),
            ),
            const Space(width: 8),
            Label(
              text: replyTitle ?? "",
              color: UIColor.unitedNationsBlue,
              weight: FontWeight.w600,
            ),
          ],
        ),
        IconButton(
          onPressed: onReplyTap,
          splashRadius: 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          iconSize: 18,
          icon: const Icon(
            CupertinoIcons.clear,
            color: UIColor.black,
          ),
        ),
      ],
    );
  }
}
