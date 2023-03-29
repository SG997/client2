import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class HomeActivities extends StatelessWidget {
  const HomeActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(),
            const Space(width: 8),
            Column(
              children: [
                Label(
                  text: "John Terdolovsky",
                  size: 12,
                  weight: FontWeight.w600,
                  color: UIColor.black.withOpacity(0.5),
                ),
                Label(
                  text: "10-7-22  |   07:45",
                  size: 12,
                  weight: FontWeight.w600,
                  color: UIColor.black.withOpacity(0.5),
                ),
              ],
            ),
            const Space(width: 8),
            Label(
              text: "mentor".toUpperCase(),
              color: UIColor.ultramarineBlue,
              size: 10,
              weight: FontWeight.w800,
            ),
          ],
        ),
        const Space(height: 8),
        Label(
          text: "Academy Name > Course Name > #8 Lesson",
          size: 12,
          weight: FontWeight.w400,
          color: UIColor.black.withOpacity(0.5),
        ),
        const Space(height: 8),
        const Label(
          text: "Anyone here have done the new treatment session from the home work?",
          size: 16,
          weight: FontWeight.w600,
        ),
        const Space(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  Assets.likeIcon,
                  color: UIColor.unitedNationsBlue,
                ),
                const Space(width: 8),
                const Label(
                  text: "you and 15 other people \nLiked this",
                  size: 12,
                  weight: FontWeight.w400,
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(
                  Icons.comment_outlined,
                ),
                Space(width: 8),
                Label(
                  text: "2 Comments",
                  size: 12,
                  weight: FontWeight.w400,
                )
              ],
            ),
          ],
        ),
        const Space(height: 8),
      ],
    );
  }
}
