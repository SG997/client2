import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class AcademyCourseHeaderBottomItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const AcademyCourseHeaderBottomItem({Key? key, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(
            text: title,
            color: UIColor.black.withOpacity(0.5),
            size: 12,
          ),
          Label(
            text: subtitle,
            color: UIColor.black,
            size: 16,
          ),
        ],
      ),
    );
  }
}
