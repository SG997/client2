import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/classes/class-item/class_item.dart';
import 'package:unimastery_mobile/presentation/ui/academy/cubit/academy_cubit.dart';

class AcademyFeaturedClasses extends StatelessWidget {
  const AcademyFeaturedClasses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AcademyPageCubit>();

    return SizedBox(
      height: 420,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cubit.featuredInfo?.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: ClassItem(info: cubit.featuredInfo ?? []),
          );
        }),
      ),
    );
  }
}
