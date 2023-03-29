import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/button/title_button.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/header/academy_header.dart';
import 'package:unimastery_mobile/presentation/ui/academy/cubit/academy_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/academy/view/academy_about.dart';
import 'package:unimastery_mobile/presentation/ui/academy/view/academy_carousel.dart';
import 'package:unimastery_mobile/presentation/ui/academy/view/academy_featured_classes.dart';
import 'package:unimastery_mobile/presentation/ui/academy/view/academy_grid.dart';
import 'package:unimastery_mobile/presentation/ui/academy/view/academy_info_chips.dart';
import 'package:unimastery_mobile/presentation/ui/academy/view/academy_recommended_classes.dart';
import 'package:unimastery_mobile/presentation/ui/academy/view/academy_recommendeds.dart';
import 'package:unimastery_mobile/presentation/ui/academy/view/academy_team.dart';
import 'package:unimastery_mobile/presentation/util/services/share_service.dart';

class AcademyBody extends StatelessWidget {
  const AcademyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final academyCubit = context.read<AcademyPageCubit>();

    return CustomScrollView(
      cacheExtent: 3500,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: AcademyHeader(
            didTapShare: () => ShareService.share(
              text: "Share",
              linkUrl: "https://unimastery.com/",
            ),
            canBeShared: true,
          ),
        ),
        const SliverToBoxAdapter(
          child: Space(height: 30),
        ),
        SliverToBoxAdapter(
          child: AcademyInfoChips(
            info: academyCubit.info ?? [],
          ),
        ),
        const SliverToBoxAdapter(
          child: Space(height: 24),
        ),
        const SliverToBoxAdapter(
          child: AcademyAbout(),
        ),
        const SliverToBoxAdapter(
          child: Space(height: 36),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: TitleAndButton(
              title: "Our Categories ",
              buttonTitle: "See All",
              onTapButton: () {},
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Space(height: 16),
        ),
        const AcademyCategoriesGrid(),
        const SliverToBoxAdapter(
          child: Space(height: 32),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: TitleAndButton(
              title: "Featured Classes",
              buttonTitle: "See All",
              onTapButton: () {},
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: AcademyFeaturedClasses(),
        ),
        const SliverToBoxAdapter(
          child: Space(height: 32),
        ),
        const SliverToBoxAdapter(
          child: AcademyCarousel(),
        ),
        const SliverToBoxAdapter(child: Space(height: 24)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: TitleAndButton(
              title: "Our Team",
              buttonTitle: "See All",
              onTapButton: () {},
            ),
          ),
        ),
        const AcademyTeamGrid(),
        const SliverToBoxAdapter(child: Space(height: 16)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: TitleAndButton(
              title: "Recommended Academies",
              buttonTitle: "See All",
              onTapButton: () {},
            ),
          ),
        ),
        const SliverToBoxAdapter(child: AcademyRecommendedAcademies()),
        const SliverToBoxAdapter(child: Space(height: 16)),
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
        const SliverToBoxAdapter(child: AcademyAcademyItem()),
        const SliverToBoxAdapter(child: Space(height: 16)),
      ],
    );
  }
}
