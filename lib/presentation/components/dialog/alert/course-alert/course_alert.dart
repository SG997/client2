import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/dialog/alert/course-alert/course_alert_body.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class CourseAlert extends StatelessWidget {
  final String? content;
  final String? leftButtonTitle;
  final String? rightButtonTitle;
  final VoidCallback? didTapLeftButton;
  final VoidCallback? didTapRightButton;
  const CourseAlert({
    Key? key,
    this.content,
    this.leftButtonTitle,
    this.rightButtonTitle,
    this.didTapLeftButton,
    this.didTapRightButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigation.pop(),
      child: Scaffold(
        backgroundColor: UIColor.clear,
        body: CourseAlertBody(
          content: content,
          leftButtonTitle: leftButtonTitle,
          rightButtonTitle: rightButtonTitle,
          didTapLeftButton: didTapLeftButton,
          didTapRightButton: didTapRightButton,
        ),
      ),
    );
  }
}
