import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextAlign? align;
  final TextDecoration? decoration;
  final String? fontFamily;

  const Label({
    Key? key,
    this.text,
    this.size,
    this.weight,
    this.color,
    this.align,
    this.decoration,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        fontFamily: fontFamily,
        fontWeight: weight,
        color: color,
        letterSpacing: 0.3,
        decoration: decoration,
      ),
    );
  }
}
