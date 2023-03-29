import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  const ProgressBar({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: UIColor.brightGray,
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: value,
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: UIColor.ultramarineBlue.withOpacity(0.8),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
