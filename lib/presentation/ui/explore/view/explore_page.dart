import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 32),
            const Label(
              text: "This page is only for demonstration purposes",
              align: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 50,
              child: PrimaryButton(
                title: "Create class",
                onTap: () => Navigation.push(RouteName.createAcademy),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: PrimaryButton(
                title: "Create session",
                onTap: () => Navigation.push(RouteName.sessionCreation),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: PrimaryButton(
                title: "Course page",
                onTap: () => Navigation.push(RouteName.coursePage),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: PrimaryButton(
                title: "Settings page",
                onTap: () => Navigation.push(RouteName.settings),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: PrimaryButton(
                title: "Academy page",
                onTap: () => Navigation.push(RouteName.academyPage),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: PrimaryButton(
                title: "PreSale Course page",
                onTap: () => Navigation.push(RouteName.preSaleCoursePage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
