import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/classes/academy_item/academy_item.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/cubit/pre_sale_course_cubit.dart';

class PreSaleCourseAcademyCard extends StatelessWidget {
  const PreSaleCourseAcademyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preSaleCubit = context.read<PreSaleCourseCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: AcademyItem(
        isSingle: true,
        info: preSaleCubit.recommendedInfo ?? [],
      ),
    );
  }
}
