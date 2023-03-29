import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class InfoChip extends StatelessWidget {
  final String text;
  final String icon;
  final String subText;
  final VoidCallback? onTap;
  final bool? isLast;
  const InfoChip({
    Key? key,
    required this.text,
    required this.icon,
    required this.subText,
    this.isLast,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            height: 22,
          ),
          Label(
            text: text,
            size: 11,
            weight: FontWeight.w600,
            color: UIColor.black,
          ),
          Label(
            text: subText,
            size: 11,
            weight: isLast ?? false ? FontWeight.w600 : FontWeight.w400,
            color: UIColor.black,
          ),
        ],
      ),
    );
  }
}
