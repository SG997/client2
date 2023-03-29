import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/app-bar/primary_app_bar.dart';
import 'package:unimastery_mobile/presentation/ui/about/view/about_body.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: const AboutBody(),
    );
  }
}
