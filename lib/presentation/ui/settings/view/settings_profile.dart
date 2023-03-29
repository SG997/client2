import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class SettingsProfile extends StatelessWidget {
  const SettingsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Space(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: UIColor.clear,
                backgroundImage: NetworkImage("https://rb.gy/j0scnj"),
              ),
              const Space(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Label(text: "Noam Altshuler-Cohen", size: 18, weight: FontWeight.w700),
                  Space(height: 4),
                  Label(text: "36, Beit-Dagan, Israel", size: 12),
                ],
              ),
            ],
          ),
        ),
        const Space(height: 24),
      ],
    );
  }
}
