import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class PrimaryTextField extends StatelessWidget {
  final Function(String)? onTextChanged;
  final bool autoFocus;
  final bool? isEditable;
  final String? error;
  final bool readOnly;
  final String? initialValue;
  final TextInputAction? inputAction;
  final Function(String?)? onSubmit;
  final VoidCallback? onTap;
  final bool filled;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? hintText;

  const PrimaryTextField({
    Key? key,
    this.onTextChanged,
    this.autoFocus = false,
    this.isEditable,
    this.error,
    this.initialValue,
    this.inputAction,
    this.onSubmit,
    this.onTap,
    this.controller,
    this.readOnly = false,
    this.filled = true,
    this.keyboardType,
    this.maxLength,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onTextChanged,
      autofocus: autoFocus,
      enabled: isEditable,
      initialValue: initialValue,
      textInputAction: inputAction,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: UIColor.black.withOpacity(0.4),
          fontSize: 14,
        ),
        counterText: "",
        fillColor: UIColor.spanishGray.withOpacity(0.15),
        filled: filled,
        isDense: true,
        errorText: error,
        border: borderWith(),
        errorBorder: borderWith(color: UIColor.darkRed),
        disabledBorder: borderWith(color: UIColor.clear),
        enabledBorder: borderWith(color: UIColor.clear),
        focusedBorder: borderWith(),
      ),
    );
  }

  borderWith({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? UIColor.jeansBlue, width: error != null ? 2 : 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
    );
  }
}
