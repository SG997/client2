import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/label/label.dart';
import 'package:unimastery_mobile/presentation/components/other/space.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class PriceLabel extends StatelessWidget {
  final String price;
  final String? discountPrice;
  final bool? hasDiscount;
  const PriceLabel({
    Key? key,
    this.hasDiscount,
    required this.price,
    this.discountPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (hasDiscount ?? false)
          Label(
            text: "\$",
            size: 7,
            color: UIColor.black.withOpacity(0.3),
          ),
        if (hasDiscount ?? false)
          Label(
            text: discountPrice ?? "",
            size: 14,
            weight: FontWeight.w400,
            decoration: TextDecoration.lineThrough,
            color: UIColor.black.withOpacity(0.3),
          ),
        if (hasDiscount ?? false) const Space(width: 8),
        const Label(
          text: "\$",
          size: 11,
        ),
        Label(
          text: price,
          size: 22,
          weight: FontWeight.w400,
          color: (hasDiscount ?? false) ? UIColor.green : null,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Label(
              text: "/",
              size: 10,
              color: UIColor.black.withOpacity(0.5),
            ),
            Label(
              text: "month",
              size: 10,
              color: UIColor.black.withOpacity(0.5),
            ),
          ],
        ),
      ],
    );
  }
}
