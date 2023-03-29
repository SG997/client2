import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/button/title_button.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/player-course-header/player_course_header.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/view/pre_sale_course_academy_card.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/view/pre_sale_course_carousel.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/view/pre_sale_course_info_chips.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/view/pre_sale_course_purchase.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/view/pre_sale_course_team_grid.dart';

class PreSaleCourseBody extends StatelessWidget {
  const PreSaleCourseBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      cacheExtent: 3500,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: UIColor.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: UIColor.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: const [
                PlayerCourseHeader(),
                Space(height: 36),
                PreSaleCourseInfoChips(),
                Space(height: 36),
                PreSaleCoursePurchase(),
                Space(height: 12),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Space(height: 36),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Label(
                  text: "About",
                  size: 18,
                  weight: FontWeight.w700,
                ),
                const Space(height: 12),
                Label(
                  text:
                      "An increasing volume of data is becoming available in biomedicine and healthcare, from genomic data, to electronic patient records and data collected by wearable devices. Recent advances in data science are transforming the life sciences, leading to precision medicine and stratified healthcare. In this course, you will learn about some of the different types of data and computational methods involved in stratified healthcare and precision medicine. You will have a hands-on experience of working with such data. And you will learn from leaders in the field about successful case studies. Topics include: (i) Sequence Processing, (ii) Image Analysis, (iii) Network Modelling, (iv) Probabilistic Modelling, (v) Machine Learning",
                  size: 12,
                  color: UIColor.black.withOpacity(0.7),
                  weight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: Space(height: 36)),
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
        const PreSaleCourseTeamGrid(),
        const SliverToBoxAdapter(child: Space(height: 36)),
        const SliverToBoxAdapter(child: PreSaleCourseCarousel()),
        const SliverToBoxAdapter(child: Space(height: 42)),
        const SliverToBoxAdapter(child: PreSaleCourseAcademyCard()),
        const SliverToBoxAdapter(child: Space(height: 36)),
      ],
    );
  }
}
