import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/classes/academy_item/academy_item.dart';
import 'package:unimastery_mobile/presentation/ui/academy/cubit/academy_cubit.dart';

class AcademyRecommendedAcademies extends StatelessWidget {
  const AcademyRecommendedAcademies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AcademyPageCubit>();

    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: cubit.recommendedInfo?.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AcademyItem(
              isSingle: false,
              info: cubit.recommendedInfo ?? [],
            ),
          );
        }),
      ),
    );
  }
}
