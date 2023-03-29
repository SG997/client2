import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class PaymentHistoryListItem extends StatelessWidget {
  const PaymentHistoryListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(
            text: "#523120  |   10-7-22 ",
            size: 10,
            color: UIColor.black.withOpacity(0.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Label(
                text: "Course name might be long",
                size: 16,
                color: UIColor.black,
                weight: FontWeight.w700,
              ),
              LabelChip(
                title: "Complete",
                textSize: 12,
                color: UIColor.black.withOpacity(0.7),
                backgroundColor: UIColor.mintGreen,
              )
            ],
          ),
          Label(
            text: "\$24",
            size: 12,
            color: UIColor.black.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
