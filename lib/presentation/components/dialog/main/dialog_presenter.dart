import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/dialog/alert/course-alert/course_alert.dart';
import 'package:unimastery_mobile/presentation/components/dialog/menu-dialog/menu_dialog.dart';
import 'package:unimastery_mobile/presentation/components/dialog/student-list/student_dialog.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/model/title_icon.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/model/student_model.dart';

class DialogPresenter {
  static showStudentListDialog(
    context, {
    required List<Student> students,
  }) async {
    return showDialog(
      context: context,
      builder: (context) {
        return StudentDialog(
          stundets: students,
        );
      },
    );
  }

  static showCourseFloatingButtons(
    context, {
    required List<TitleIcon> items,
    required Function(TitleIcon) onTap,
  }) async {
    return await showDialog(
      context: context,
      builder: (_) {
        return MenuDialog(
          items: items,
          onTap: onTap,
        );
      },
    );
  }

  static showCourseAlert(
    context, {
    String? content,
    String? leftButtonTitle,
    String? rightButtonTitle,
    VoidCallback? didTapLeftButton,
    VoidCallback? didTapRightButton,
  }) async {
    return await showDialog(
      barrierColor: UIColor.black.withOpacity(0.5),
      context: context,
      builder: (context) {
        return CourseAlert(
          content: content,
          leftButtonTitle: leftButtonTitle,
          rightButtonTitle: rightButtonTitle,
          didTapLeftButton: didTapLeftButton,
          didTapRightButton: didTapRightButton,
        );
      },
    );
  }
}
