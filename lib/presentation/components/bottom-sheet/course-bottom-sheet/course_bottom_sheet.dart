import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/bottom-sheet/course-bottom-sheet/course_bottom_sheet_list.dart';
import 'package:unimastery_mobile/presentation/components/bottom-sheet/course-bottom-sheet/course_bottom_sheet_top_item.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';

class CourseBottomSheet extends StatelessWidget {
  final double? height;
  final String? titleText;
  final String? text;

  const CourseBottomSheet({
    Key? key,
    this.height,
    this.titleText,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: height ?? 0.84,
      child: Column(
        children: [
          const Space(height: 16),
          CourseBottomSheetTopItem(titleText: titleText),
          CourseBottomSheetList(text: text),
        ],
      ),
    );
  }
}
