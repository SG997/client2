import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class ChatInputAddItem extends StatelessWidget {
  final VoidCallback? didTap;
  final IconData? icon;
  final String? title;
  final double? size;
  const ChatInputAddItem({
    Key? key,
    this.didTap,
    this.icon,
    this.title,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: didTap,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CircleAvatar(
            child: Icon(icon, size: size),
          ),
          Label(
            text: title,
            color: UIColor.black,
            size: 12,
          ),
        ],
      ),
    );
  }
}
