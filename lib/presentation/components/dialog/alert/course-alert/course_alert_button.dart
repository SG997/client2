import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class CourseAlertButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const CourseAlertButton({Key? key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderButton(
      title: title,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      color: UIColor.black,
      borderColor: UIColor.black,
      fontWeight: FontWeight.w400,
      onTap: onTap,
    );
  }
}
