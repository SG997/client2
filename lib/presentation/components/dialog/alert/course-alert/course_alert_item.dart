import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/dialog/alert/course-alert/course_alert_button.dart';
import 'package:unimastery_mobile/presentation/components/dialog/alert/course-alert/course_alert_icon.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class CourseAlertItem extends StatelessWidget {
  final String? content;
  final String? leftButtonTitle;
  final String? rightButtonTitle;
  final VoidCallback? didTapLeftButton;
  final VoidCallback? didTapRightButton;
  const CourseAlertItem({
    Key? key,
    this.content,
    this.leftButtonTitle,
    this.rightButtonTitle,
    this.didTapLeftButton,
    this.didTapRightButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CourseAlertIcon(),
          const Space(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Label(
              align: TextAlign.center,
              text: content ?? "",
              size: 14,
              weight: FontWeight.w400,
              color: UIColor.black.withOpacity(0.7),
            ),
          ),
          const Space(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CourseAlertButton(
                onTap: didTapLeftButton,
                title: leftButtonTitle,
              ),
              const Space(width: 16),
              CourseAlertButton(
                onTap: didTapRightButton,
                title: rightButtonTitle,
              ),
            ],
          ),
          const Space(height: 24),
        ],
      ),
    );
  }
}
