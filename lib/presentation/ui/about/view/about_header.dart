import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class AboutHeader extends StatelessWidget {
  final String title;
  const AboutHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Label(
      text: title,
      size: 18,
      color: UIColor.black,
      weight: FontWeight.w700,
    );
  }
}
