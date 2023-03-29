import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class LabelChip extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? textSize;

  const LabelChip({
    Key? key,
    required this.title,
    this.color,
    this.backgroundColor,
    this.padding,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? UIColor.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        child: Label(
          align: TextAlign.center,
          color: color ?? UIColor.white,
          text: title,
          size: textSize ?? 10,
        ),
      ),
    );
  }
}
