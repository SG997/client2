import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';

class CourseBottomSheetList extends StatelessWidget {
  final String? text;
  const CourseBottomSheetList({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          const Space(height: 16),
          if (text != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Label(text: text ?? ""),
            ),
          const Space(height: 32),
        ],
      ),
    );
  }
}
