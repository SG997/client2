import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/navbar/primary_bottom_navbar_controller.dart';
import 'package:unimastery_mobile/presentation/components/navbar/primary_bottom_navigation_bar.dart';
import 'package:unimastery_mobile/presentation/ui/bookmark/view/bookmark_page.dart';
import 'package:unimastery_mobile/presentation/ui/explore/view/explore_page.dart';
import 'package:unimastery_mobile/presentation/ui/home/view/home_page.dart';
import 'package:unimastery_mobile/presentation/ui/my-academies/view/bookmark_page.dart';

class RootPage extends StatelessWidget {
  final PrimaryBottomNavbarController controller;

  final List<Widget> _pages = [
    const HomePage(),
    const BookMarkPage(),
    const ExplorePage(),
    const SavedPage(),
  ];

  RootPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        titleText: "HOME",
      ),
      body: StreamBuilder<int>(
        stream: controller.currentIndex,
        builder: (context, snapshot) {
          return IndexedStack(
            index: snapshot.data ?? 0,
            children: _pages,
          );
        },
      ),
      bottomNavigationBar: PrimaryBottomNavBar(
        controller: controller,
      ),
    );
  }
}
