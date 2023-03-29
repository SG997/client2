import 'package:flutter/cupertino.dart';
import 'package:unimastery_mobile/presentation/components/button/border_button.dart';
import 'package:unimastery_mobile/presentation/components/header/academy_header.dart';
import 'package:unimastery_mobile/presentation/components/label/label.dart';
import 'package:unimastery_mobile/presentation/components/other/space.dart';
import 'package:unimastery_mobile/presentation/components/progress-indicator/progress_indicator.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class InProgressAcademyItem extends StatelessWidget {
  final bool? canBeShared;
  const InProgressAcademyItem({
    Key? key,
    this.canBeShared,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIColor.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: UIColor.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      width: 269,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigation.push(RouteName.academyPage),
              child: AcademyHeader(
                didTapAcademy: () => Navigation.push(RouteName.academyPage),
                canBeShared: canBeShared,
              ),
            ),
          ),
          const Space(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Label(
                      text: "Title of the session name",
                      size: 12,
                      weight: FontWeight.w600,
                    ),
                    Container(
                      width: 24,
                      height: 13,
                      decoration: BoxDecoration(
                        color: UIColor.pastelRed,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Label(
                          text: "2",
                          color: UIColor.white,
                          size: 10,
                          weight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
                Label(
                  text: "Lesson 14 | 13:42",
                  size: 10,
                  weight: FontWeight.w400,
                  color: UIColor.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
          const Space(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ProgressBar(
              value: 0.6,
            ),
          ),
          const Space(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BorderButton(
              title: "Keep Watching",
              color: UIColor.black,
              onTap: () {},
              fontWeight: FontWeight.w400,
            ),
          ),
          const Space(height: 24),
        ],
      ),
    );
  }
}
