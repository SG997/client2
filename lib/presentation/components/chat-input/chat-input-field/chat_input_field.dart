import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class ChatInputField extends StatelessWidget {
  final Function(String)? onTextChanged;
  final bool autoFocus;
  final VoidCallback? onTap;
  final Function(String?)? onSubmit;
  final TextEditingController? controller;
  final bool readOnly;
  final FocusNode? focusNode;

  const ChatInputField({
    Key? key,
    this.onTextChanged,
    required this.autoFocus,
    this.onSubmit,
    this.controller,
    this.onTap,
    this.readOnly = false,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: UIColor.philippineSilver),
        ),
        child: TextField(
          focusNode: focusNode,
          onTap: onTap,
          autofocus: autoFocus,
          controller: controller,
          onChanged: onTextChanged,
          onSubmitted: onSubmit,
          minLines: 1,
          maxLines: 2,
          textInputAction: TextInputAction.done,
          style: const TextStyle(fontSize: 12, color: UIColor.black),
          keyboardType: TextInputType.multiline,
          cursorColor: Colors.black,
          readOnly: readOnly,
          decoration: const InputDecoration(
            isDense: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            hintText: "Type...",
            hintStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: UIColor.black,
            ),
          ),
        ),
      ),
    );
  }
}
