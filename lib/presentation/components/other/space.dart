import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/util/config.dart';

class Space extends StatelessWidget {
  final double? height;
  final double? width;

  const Space({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height != null ? (height ?? 0) * Config.multiplier : null,
      width: width != null ? (width ?? 0) * Config.multiplier : null,
    );
  }
}
