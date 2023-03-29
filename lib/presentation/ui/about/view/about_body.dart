import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/ui/about/view/about_info_chips.dart';
import 'package:unimastery_mobile/presentation/ui/about/view/about_page_view.dart';
import 'package:unimastery_mobile/presentation/ui/about/view/about_slider_indicator.dart';
import 'package:unimastery_mobile/presentation/ui/about/view/about_sliver_grid.dart';
import 'package:unimastery_mobile/presentation/ui/about/view/about_top_text.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          AboutInfoChips(),
          AboutTopText(),
          AboutSliverGrid(),
          AboutPageView(),
          AboutSliderIndicator(),
        ],
      ),
    );
  }
}
