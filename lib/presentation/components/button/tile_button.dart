import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class TileButton extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback? onTapTile;

  const TileButton({
    Key? key,
    required this.title,
    required this.buttonTitle,
    this.onTapTile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Label(
          text: title,
          size: 12,
          color: UIColor.black.withOpacity(0.5),
        ),
        // SizedBox(width: 8),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
          ),
          onPressed: onTapTile,
          child: Label(
            text: buttonTitle,
            decoration: TextDecoration.underline,
            color: UIColor.unitedNationsBlue,
            weight: FontWeight.bold,
            size: 12,
          ),
        ),
      ],
    );
  }
}
