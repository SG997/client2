import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/about/cubit/about_cubit.dart';

class AboutPageView extends StatelessWidget {
  const AboutPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aboutCubit = context.read<AboutCubit>();
    return SliverToBoxAdapter(
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
            controller: aboutCubit.pageController,
            carouselController: aboutCubit.carouselController,
          ),
        ],
      ),
    );
  }
}
