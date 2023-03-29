import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class OptionSelectorButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String? icon;
  final bool? hasIcon;

  const OptionSelectorButton({
    Key? key,
    this.onTap,
    required this.title,
    this.icon,
    this.hasIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: UIColor.ultramarineBlue,
        backgroundColor: UIColor.white,
        shadowColor: UIColor.black.withOpacity(0.1),
        elevation: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (hasIcon ?? false)
            Image.asset(
              icon ?? "",
            ),
          if (hasIcon ?? false) const Space(height: 8),
          Label(
            text: title,
            color: UIColor.ultramarineBlue,
            weight: FontWeight.w600,
            size: 14,
          ),
        ],
      ),
    );
  }
}
