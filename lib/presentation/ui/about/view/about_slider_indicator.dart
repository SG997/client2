import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/about/cubit/about_cubit.dart';

class AboutSliderIndicator extends StatelessWidget {
  const AboutSliderIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AboutCubit>();
    return SliverToBoxAdapter(
      child: Column(
        children: [
          PageIndicator(carouselController: cubit.carouselController),
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
