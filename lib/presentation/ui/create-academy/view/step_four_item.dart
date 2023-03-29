import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class StepFourItem extends StatelessWidget {
  final String title;
  final String leading;
  final String trailing;
  final VoidCallback onTap;
  const StepFourItem({
    Key? key,
    required this.title,
    required this.leading,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      minLeadingWidth: 18,
      leading: SvgPicture.asset(leading, height: 22),
      title: Label(text: title, size: 12),
      trailing: Label(text: trailing, size: 10, color: UIColor.black.withOpacity(0.5)),
    );
  }
}
