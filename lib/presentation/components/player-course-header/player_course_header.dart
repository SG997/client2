import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/assets.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class PlayerCourseHeader extends StatelessWidget {
  const PlayerCourseHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  color: UIColor.black,
                  child: VideoPlayerCard(
                    title: "Workshop",
                    onTap: () {},
                    videoState: VideoState.uploaded,
                  ),
                ),
                const Space(height: 20),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  Assets.curvedImageBackground,
                  height: 66,
                  width: 86,
                ),
                const CircleAvatar(
                  backgroundColor: UIColor.white,
                  radius: 26,
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
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: UIColor.white,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: const Icon(
                        Icons.share_outlined,
                        size: 16,
                        color: UIColor.black,
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
                      child: const Icon(
                        CupertinoIcons.bookmark_fill,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(
                text: "Trading Academy",
                color: UIColor.black.withOpacity(0.5),
                size: 12,
              ),
              const Label(
                text: "Forex 0 to 100 get yourself together",
                color: UIColor.black,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
