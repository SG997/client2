import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/list/view/team_list.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/cubit/pre_sale_course_cubit.dart';

class PreSaleCourseTeamGrid extends StatelessWidget {
  const PreSaleCourseTeamGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preSaleCourseCubit = context.read<PreSaleCourseCubit>();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: TeamList(
        cardController: preSaleCourseCubit.cardController,
      ),
    );
  }
}
