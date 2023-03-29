import 'package:flutter/cupertino.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class BorderButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? color;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final Color? borderColor;
  const BorderButton({Key? key, this.title, this.onTap, this.icon, this.color, this.padding, this.borderColor, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: UIColor.white.withOpacity(.5),
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: borderColor ?? UIColor.black.withOpacity(.1), width: 1),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(
                  icon,
                  color: UIColor.unitedNationsBlue,
                  size: 18,
                ),
              ),
            Label(
              text: title ?? "",
              weight: fontWeight ?? FontWeight.w700,
              size: 12,
              color: color ?? UIColor.unitedNationsBlue,
            ),
          ],
        ),
      ),
    );
  }
}
