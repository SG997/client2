import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/classes/academy_item/academy_item.dart';
import 'package:unimastery_mobile/presentation/ui/home/cubit/home_page_cubit.dart';
import 'package:unimastery_mobile/presentation/util/services/share_service.dart';

class HomeRecommendedAcademies extends StatelessWidget {
  const HomeRecommendedAcademies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();
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
              didTapShare: () => ShareService.share(text: "Share", linkUrl: "https://unimastery.com/"),
              canBeShared: true,
              isSingle: false,
              info: cubit.recommendedInfo ?? [],
            ),
          );
        }),
      ),
    );
  }
}
