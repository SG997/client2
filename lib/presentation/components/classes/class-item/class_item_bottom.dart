import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/label/price_label.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class ClassItemBottom extends StatelessWidget {
  const ClassItemBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.likeIcon,
                ),
              ),
              const Space(width: 8),
              const Label(
                text: "123 Likes",
                weight: FontWeight.w600,
              ),
            ],
          ),
          const PriceLabel(
            price: "55",
          ),
        ],
      ),
    );
  }
}
