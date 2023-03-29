import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/classes/class-item/class_item.dart';
import 'package:unimastery_mobile/presentation/ui/home/cubit/home_page_cubit.dart';

class HomeRecommendedClasses extends StatelessWidget {
  const HomeRecommendedClasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();
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
