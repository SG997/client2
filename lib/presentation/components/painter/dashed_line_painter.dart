import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;

  DashedLinePainter({
    this.dashWidth = 3,
    this.dashSpace = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;

    final paint = Paint()
      ..color = UIColor.lightSilver
      ..strokeWidth = 2;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
