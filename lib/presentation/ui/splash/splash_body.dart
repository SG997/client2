import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GradientWrapper(
      child: Center(
        child: Logo(),
      ),
    );
  }
}
