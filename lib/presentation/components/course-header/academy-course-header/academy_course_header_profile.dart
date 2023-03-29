import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class AcademyCourseHeaderProfile extends StatelessWidget {
  final ImageProvider? avatarImage;
  final bool isAvatarSmall;

  const AcademyCourseHeaderProfile({
    Key? key,
    this.avatarImage,
    this.isAvatarSmall = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            Assets.curvedImageBackground,
            width: isAvatarSmall ? 56 : 100,
          ),
          CircleAvatar(
            radius: isAvatarSmall ? 15 : 26,
            backgroundColor: UIColor.clear,
            backgroundImage: avatarImage,
          )
        ],
      ),
    );
  }
}
