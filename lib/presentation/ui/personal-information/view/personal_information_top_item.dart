import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class PersonalInformationTopItem extends StatelessWidget {
  const PersonalInformationTopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Space(height: 32),
          Label(
            text: "Personal Information",
            size: 22,
            weight: FontWeight.w700,
          ),
          Space(height: 24),
          CircleAvatar(
            radius: 44,
            backgroundColor: UIColor.clear,
            backgroundImage: NetworkImage("https://rb.gy/j0scnj"),
          ),
          Space(height: 24),
        ],
      ),
    );
  }
}
