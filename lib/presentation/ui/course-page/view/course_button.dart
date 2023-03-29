import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/dialog/main/dialog_presenter.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/model/title_icon.dart';

class CourseButton extends StatelessWidget {
  final List<TitleIcon>? items;
  const CourseButton({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 26,
      child: PrimaryButton(
        onTap: () {
          DialogPresenter.showCourseFloatingButtons(
            context,
            onTap: (value) => Navigation.push(value.route),
            items: items ?? [],
          );
        },
        title: '',
        icon: const Icon(Icons.add, color: UIColor.white),
      ),
    );
  }
}
