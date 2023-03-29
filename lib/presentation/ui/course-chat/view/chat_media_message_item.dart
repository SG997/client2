import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/model/message_model.dart';

class ChatMediaMessageItem extends StatelessWidget {
  final MessageType? messageType;
  final bool? needMinimizing;
  final String? url;
  final VoidCallback? onTapCancel;
  final String? title;
  const ChatMediaMessageItem({
    Key? key,
    this.url,
    this.onTapCancel,
    this.title,
    this.needMinimizing,
    this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Label(text: title ?? ""),
                const Space(
                  height: 4,
                ),
              ],
            ),
          ),
        if (url != null && messageType == MessageType.file)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: UIColor.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: UIColor.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.insert_drive_file,
                  color: UIColor.black,
                ),
                const Space(
                  width: 8,
                ),
                Expanded(
                  child: Label(
                    text: url?.split("/").last,
                  ),
                ),
                if (onTapCancel != null)
                  InkWell(
                    onTap: onTapCancel,
                    child: const Icon(
                      Icons.close,
                      color: UIColor.black,
                    ),
                  ),
              ],
            ),
          ),
        if (url != null && messageType != MessageType.file)
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(
                    url ?? "",
                  ),
                  width: double.infinity,
                  height: needMinimizing ?? false ? 75 : 150,
                  fit: BoxFit.fitWidth,
                ),
              ),
              if (onTapCancel != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: UIColor.white,
                    child: IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: onTapCancel,
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
