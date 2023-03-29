import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/presentation/components/chip/info_chips.dart';
import 'package:unimastery_mobile/presentation/components/dialog/main/dialog_presenter.dart';
import 'package:unimastery_mobile/presentation/ui/academy/cubit/academy_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/academy/model/info_model.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/cubit/pre_sale_course_cubit.dart';

class AcademyInfoChips extends StatelessWidget {
  final List<InfoModel> info;
  const AcademyInfoChips({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final academyCubit = context.read<AcademyPageCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: info.map((e) {
        {
          return InfoChip(
            text: e.text,
            icon: e.icon,
            subText: e.subtext,
            isLast: info.last == e,
            onTap: () {
              if (e.type == InfoModelType.students) {
                DialogPresenter.showStudentListDialog(context, students: academyCubit.students);
              }
            },
          );
        }
      }).toList(),
    );
  }
}
