import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/about/view/about_header.dart';

class AboutTopText extends StatelessWidget {
  const AboutTopText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Space(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Label(
                text: "The course created at 10/07/2022",
                size: 10,
                color: UIColor.black.withOpacity(0.4),
              ),
              Label(
                text: "Group #543464",
                size: 10,
                color: UIColor.black.withOpacity(0.4),
              ),
            ],
          ),
          const Space(height: 24),
          const AboutHeader(title: "About"),
          const Space(height: 12),
          Label(
            text:
                "An increasing volume of data is becoming available in biomedicine and healthcare, from genomic data, to electronic patient records and data collected by wearable devices. Recent advances in data science are transforming the life sciences, leading to precision medicine and stratified healthcare. In this course, you will learn about some of the different types of data and computational methods involved in stratified healthcare and precision medicine. You will have a hands-on experience of working with such data. And you will learn from leaders in the field about successful case studies. Topics include: (i) Sequence Processing, (ii) Image Analysis, (iii) Network Modelling, (iv) Probabilistic Modelling, (v) Machine Learning",
            size: 12,
            color: UIColor.black.withOpacity(0.7),
            weight: FontWeight.w400,
          ),
          const Space(height: 24),
          const AboutHeader(title: "Our Team"),
          const Space(height: 16),
        ],
      ),
    );
  }
}
