import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class CourseAlertIcon extends StatelessWidget {
  const CourseAlertIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          splashRadius: 8,
          onPressed: () => Navigation.pop(),
          constraints: const BoxConstraints(),
          icon: CircleAvatar(
            radius: 12,
            backgroundColor: UIColor.black.withOpacity(0.1),
            child: const Icon(
              Icons.clear,
              size: 16,
              color: UIColor.black,
            ),
          ),
        ),
      ),
    );
  }
}
