import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/label/label.dart';
import 'package:unimastery_mobile/presentation/components/other/space.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/assets.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class HomeBottomSheet extends StatelessWidget {
  final String? title;
  final String? image;
  final String? description;
  const HomeBottomSheet({
    Key? key,
    this.title,
    this.image,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: UIColor.brightGray,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Navigation.pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: UIColor.black,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(image ?? ""),
        ),
        Label(
          text: title ?? "",
          size: 18,
          weight: FontWeight.w700,
        ),
        Label(
          text: description ?? "",
          size: 12,
          weight: FontWeight.w400,
          color: UIColor.black.withOpacity(0.7),
        ),
        const Space(height: 36),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigation.push(RouteName.settings);
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    Assets.settingsIcon,
                    height: 36,
                  ),
                  const Space(height: 4),
                  const Label(
                    text: "Settings",
                    size: 12,
                    weight: FontWeight.w400,
                    color: UIColor.black,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SvgPicture.asset(
                  Assets.unimasteryIcon,
                  height: 36,
                ),
                const Space(height: 4),
                const Label(
                  text: "Create an Academy",
                  size: 12,
                  weight: FontWeight.w400,
                ),
              ],
            ),
            Column(
              children: [
                SvgPicture.asset(
                  Assets.commentIcon,
                  height: 36,
                ),
                const Space(height: 4),
                const Label(
                  text: "Contact us",
                  size: 12,
                  weight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
        const Space(height: 36),
      ],
    );
  }
}
