import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/app-bar/primary_app_bar.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/cubit/course_page_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/view/course_body.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/view/course_button.dart';

class CoursePage extends StatelessWidget {
  final CoursePageSituations situation;
  const CoursePage({Key? key, required this.situation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coursePageCubit = context.read<CoursePageCubit>();

    return StreamBuilder<int>(
      stream: coursePageCubit.currentIndexStream,
      builder: (context, snapshot) {
        final index = snapshot.data == 0;

        return Scaffold(
          appBar: PrimaryAppBar(),
          backgroundColor: UIColor.white,
          body: CourseBody(situation: situation),
          floatingActionButton: index ? CourseButton(items: coursePageCubit.items) : null,
        );
      },
    );
  }
}
