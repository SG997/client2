import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';

class AcademyAbout extends StatelessWidget {
  const AcademyAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Label(
            text: "About",
            size: 18,
            weight: FontWeight.w700,
          ),
          const Space(height: 12),
          ReadMoreText(
            "Our courses are based on the best Strategy builder programs on the market for creating Forex strategies and Expert Advisors. In this way, we eliminate…",
            trimCollapsedText: " Read more",
            trimExpandedText: " Read less",
            trimMode: TrimMode.Line,
            trimLines: 2,
            moreStyle: textStyle(isBold: true),
            style: textStyle(isBold: false),
            textAlign: TextAlign.justify,
            lessStyle: textStyle(isBold: true),
          ),
        ],
      ),
    );
  }

  TextStyle textStyle({required bool isBold}) => TextStyle(
        fontSize: 12,
        fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
      );
}
