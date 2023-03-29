import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/button/secondary_button.dart';
import 'package:unimastery_mobile/presentation/components/label/label.dart';

class TitleAndButton extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback onTapButton;
  const TitleAndButton({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.onTapButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Label(
          text: title,
          size: 18,
          weight: FontWeight.w700,
        ),
        SecondaryButton(
          title: buttonTitle,
          onTap: onTapButton,
        ),
      ],
    );
  }
}
