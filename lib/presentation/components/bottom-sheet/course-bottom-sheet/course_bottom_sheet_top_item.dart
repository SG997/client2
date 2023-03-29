import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class CourseBottomSheetTopItem extends StatelessWidget {
  final String? titleText;
  const CourseBottomSheetTopItem({Key? key, this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Label(
            text: titleText ?? "",
            size: 22,
            weight: FontWeight.w700,
          ),
          GestureDetector(
            onTap: () => Navigation.pop(),
            child: const CircleAvatar(
              radius: 12,
              backgroundColor: UIColor.brightGray,
              child: Icon(
                Icons.clear,
                color: UIColor.black,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
