import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/chip/info_chips.dart';
import 'package:unimastery_mobile/presentation/components/dialog/main/dialog_presenter.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/cubit/pre_sale_course_cubit.dart';

class PreSaleCourseInfoChips extends StatelessWidget {
  const PreSaleCourseInfoChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preSaleCourseCubit = context.read<PreSaleCourseCubit>();
    final info = preSaleCourseCubit.info ?? [];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: info.map((e) {
        return InfoChip(
          onTap: () {
            if (e.type == InfoModelType.students) {
              DialogPresenter.showStudentListDialog(
                context,
                students: preSaleCourseCubit.students ?? [],
              );
            }
          },
          text: e.text,
          icon: e.icon,
          subText: e.subtext,
        );
      }).toList(),
    );
  }
}
