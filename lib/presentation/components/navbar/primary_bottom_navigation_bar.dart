import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/navbar/primary_bottom_navbar_controller.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class PrimaryBottomNavBar extends StatelessWidget {
  final PrimaryBottomNavbarController controller;

  const PrimaryBottomNavBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: controller.currentIndex,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          currentIndex: snapshot.data ?? 0,
          items: controller.items.map((item) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                item.asset,
                color: UIColor.lightSilver,
              ),
              activeIcon: SvgPicture.asset(
                item.asset,
                color: UIColor.black,
              ),
              label: "",
            );
          }).toList(),
          onTap: (index) {
            controller.change(index);
            HapticFeedback.lightImpact();
          },
        );
      },
    );
  }
}
