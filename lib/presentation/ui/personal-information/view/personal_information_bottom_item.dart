import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class PersonalInformationBottomItem extends StatelessWidget {
  const PersonalInformationBottomItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Label(
            text: "Interesting in",
            size: 12,
            color: UIColor.black.withOpacity(0.5),
          ),
          Row(
            children: [1, 2, 3, 4].map((e) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(
                  backgroundColor: UIColor.unitedNationsBlue.withOpacity(0.1),
                  label: const Label(text: "Sports", size: 12),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
