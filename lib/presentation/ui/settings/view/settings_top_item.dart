import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';

class SettingsTopItem extends StatelessWidget {
  const SettingsTopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Space(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Label(
                text: "Settings",
                size: 28,
                weight: FontWeight.w700,
              ),
              // TextButton.icon(
              //   style: ButtonStyle(
              //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //       RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8.0),
              //       ),
              //     ),
              //     overlayColor: MaterialStateColor.resolveWith(
              //       (states) => UIColor.lightSilver.withOpacity(0.3),
              //     ),
              //   ),
              //   onPressed: () {},
              //   icon: SvgPicture.asset(Assets.logout),
              //   label: const Label(
              //     text: "Log Out",
              //     size: 12,
              //     color: UIColor.black,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
