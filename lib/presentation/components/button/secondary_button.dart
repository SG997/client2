import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class SecondaryButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const SecondaryButton({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Label(
        text: title ?? "",
        weight: FontWeight.w400,
        size: 12,
        color: UIColor.black.withOpacity(.5),
      ),
    );
  }
}
