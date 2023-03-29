import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/presentation/components/button/title_button.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/home/cubit/home_page_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/home/view/home_featured_classes.dart';
import 'package:unimastery_mobile/presentation/ui/home/view/home_my_academies.dart';
import 'package:unimastery_mobile/presentation/ui/home/view/home_my_classes.dart';
import 'package:unimastery_mobile/presentation/ui/home/view/home_recommended_academies.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      cacheExtent: 3500,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              bottom: 15,
              top: 20,
            ),
            child: GestureDetector(
              onTap: () {
                Scrollable.ensureVisible(
                  cubit.key.currentContext ?? context,
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 250),
                );
              },
              child: Image.asset(
                Assets.homeDummyImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 48,
              child: PrimaryButton(
                title: "Want to create an academy?",
                onTap: () {},
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: Space(height: 24)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TitleAndButton(
              buttonTitle: "See All",
              onTapButton: () {},
              title: "My Classes",
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: HomeMyClasses(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: TitleAndButton(
              key: cubit.key,
              title: "Recommended Academies",
              buttonTitle: "See All",
              onTapButton: () {},
            ),
          ),
        ),
        const SliverToBoxAdapter(child: HomeRecommendedAcademies()),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: TitleAndButton(
              title: "My Academies",
              buttonTitle: "See All",
              onTapButton: () {},
            ),
          ),
        ),
        const SliverToBoxAdapter(child: HomeMyAcademies()),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: TitleAndButton(
              title: "Recommended Classes",
              buttonTitle: "See All",
              onTapButton: () {},
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: HomeRecommendedClasses(),
        ),
      ],
    );
  }
}
