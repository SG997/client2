import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class MultilineTextField extends StatelessWidget {
  final Function(String)? onTextChanged;
  final bool autoFocus;
  final bool? isEditable;
  final String? error;
  final String? counter;
  final String? initialValue;
  final String? hintText;
  final bool? isFocused;
  final TextInputAction? inputAction;
  final Function(String?)? onSubmit;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  const MultilineTextField({
    Key? key,
    this.onTextChanged,
    this.isFocused = false,
    this.autoFocus = false,
    this.isEditable,
    this.error,
    this.initialValue,
    this.inputAction,
    this.onSubmit,
    this.onTap,
    this.controller,
    this.counter,
    this.hintText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: error == null ? UIColor.jeansBlue : UIColor.darkRed,
              width: error == null ? 1 : 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: controller,
              onChanged: onTextChanged,
              autofocus: autoFocus,
              style: TextStyle(
                fontSize: 12,
                color: UIColor.black.withOpacity(0.5),
              ),
              enabled: isEditable,
              textInputAction: inputAction,
              onSubmitted: onSubmit,
              onTap: onTap,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 3,
              maxLength: 1000,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                counterStyle: TextStyle(
                  fontSize: 10,
                  color: UIColor.black.withOpacity(0.3),
                ),
                isDense: true,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        const Space(height: 6),
        Text(
          error ?? "",
          style: const TextStyle(color: UIColor.darkRed, fontSize: 12),
        )
      ],
    );
  }
}
