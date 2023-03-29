import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/dialog/alert/course-alert/course_alert_item.dart';

class CourseAlertBody extends StatelessWidget {
  final String? content;
  final String? leftButtonTitle;
  final String? rightButtonTitle;
  final VoidCallback? didTapLeftButton;
  final VoidCallback? didTapRightButton;
  const CourseAlertBody({
    Key? key,
    this.content,
    this.leftButtonTitle,
    this.rightButtonTitle,
    this.didTapLeftButton,
    this.didTapRightButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SizedBox(
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: CourseAlertItem(
              content: content,
              leftButtonTitle: leftButtonTitle,
              rightButtonTitle: rightButtonTitle,
              didTapLeftButton: didTapLeftButton,
              didTapRightButton: didTapRightButton,
            ),
          ),
        ),
      ),
    );
  }
}
