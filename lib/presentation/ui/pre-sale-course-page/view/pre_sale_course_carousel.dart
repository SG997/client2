import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/cubit/pre_sale_course_cubit.dart';

class PreSaleCourseCarousel extends StatelessWidget {
  const PreSaleCourseCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preSaleCourseCubit = context.read<PreSaleCourseCubit>();
    return Container(
      color: UIColor.unitedNationsBlue.withOpacity(0.05),
      child: Column(
        children: [
          const Space(height: 32),
          const Label(
            text: "our students speaking about",
            size: 18,
            color: UIColor.black,
          ),
          const Space(height: 16),
          Label(
            text: "Forex 0 to 100 get yourself together".toUpperCase(),
            size: 21,
            weight: FontWeight.w700,
            color: UIColor.ultramarineBlue,
            align: TextAlign.center,
          ),
          const Space(height: 16),
          TestimonialsCarousel(
            padding: 8,
            carouselController: preSaleCourseCubit.carouselController,
            controller: preSaleCourseCubit.pageController,
          ),
          PageIndicator(
            carouselController: preSaleCourseCubit.carouselController,
          ),
          const Space(height: 32),
          BorderButton(
            title: "View all",
            color: UIColor.black,
            onTap: () {},
          ),
          const Space(height: 32),
        ],
      ),
    );
  }
}
