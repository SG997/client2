import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/bottom-sheet/course-bottom-sheet/course_bottom_sheet.dart';
import 'package:unimastery_mobile/presentation/components/bottom-sheet/home-bottom-sheet/home_bottom_sheet.dart';

class BottomSheetPresenter {
  static showCourseBottomSheet(
    context, {
    String? titleText,
    String? text,
    bool isDismissible = true,
    double? height,
  }) async {
    return await showRoundedBottomSheet(
      context: context,
      isScroll: true,
      child: CourseBottomSheet(
        height: height,
        text: text,
        titleText: titleText,
      ),
    );
  }

  static showHomeBottomSheet(
    context, {
    String? title,
    String? description,
    String? image,
  }) async {
    return await showRoundedBottomSheet(
      context: context,
      child: HomeBottomSheet(
        title: title,
        description: description,
        image: image,
      ),
    );
  }

  static showRoundedBottomSheet({required BuildContext context, required Widget child, bool? isScroll}) async {
    return await showModalBottomSheet(
      isScrollControlled: isScroll ?? false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      context: context,
      builder: (_) {
        return child;
      },
    );
  }
}
