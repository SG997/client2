import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class AcademyHeader extends StatelessWidget {
  final bool? canBeShared;
  final bool? containsRadius;
  final VoidCallback? didTapAcademy;
  final VoidCallback? didTapShare;
  const AcademyHeader({
    Key? key,
    this.canBeShared,
    this.containsRadius,
    this.didTapAcademy,
    this.didTapShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: didTapAcademy,
              child: Column(
                children: [
                  Image.asset(
                    Assets.academyBackground,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                  const Space(height: 20)
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  Assets.curvedImageBackground,
                  height: 88,
                  width: 120,
                ),
                const CircleAvatar(
                  backgroundColor: UIColor.white,
                  radius: 32,
                  backgroundImage: NetworkImage(
                    "https://rb.gy/j0scnj",
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Row(
                children: [
                  if (canBeShared ?? false)
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: UIColor.white,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: didTapShare,
                        child: const Icon(
                          Icons.share_outlined,
                          size: 16,
                          color: UIColor.spanishGray,
                        ),
                      ),
                    ),
                  const Space(width: 8),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: UIColor.white,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.bookmark_fill,
                        size: 16,
                        color: UIColor.black.withOpacity(0.2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Center(
          child: Label(
            text: "Trading Acadesmy",
            color: UIColor.black,
            size: 16,
            weight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
