import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/academy/cubit/academy_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/academy/view/academy_body.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/view/course_button.dart';

class AcademyPage extends StatelessWidget {
  const AcademyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final academyPageCubit = context.read<AcademyPageCubit>();
    return Scaffold(
      backgroundColor: UIColor.white,
      appBar: PrimaryAppBar(),
      body: const AcademyBody(),
      floatingActionButton: CourseButton(
        items: academyPageCubit.menuItems ?? [],
      ),
    );
  }
}
