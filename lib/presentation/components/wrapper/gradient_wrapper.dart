import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class GradientWrapper extends StatelessWidget {
  final Widget? child;

  const GradientWrapper({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: UIColor.primaryGradient,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          tileMode: TileMode.decal,
          stops: [0.07, 0.2, 1],
        ),
      ),
      child: child,
    );
  }
}
