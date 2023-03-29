import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class Logo extends StatelessWidget {
  final double? scale;
  final Axis? axis;

  const Logo({Key? key, this.scale = 3, this.axis = Axis.vertical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      axis == Axis.vertical ? Assets.logoVertical : Assets.logoHorizontal,
      scale: scale,
      fit: BoxFit.contain,
    );
  }
}
