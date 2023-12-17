
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';

class DottedCirclePainter extends CustomPainter {
  DottedCirclePainter({
    this.length = 24,
    this.height,
    this.width,
    required this.color,
    this.strokeWidth = 2,
  });

  final int length;
  final double? height;
  final double? width;
  final Color color;
  final int strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final dashLineBrush = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final dashLength = pi * 2 / length;

    for (int index = 0; index < length; index++) {
      if (index % 2 == 0) {
        final rect = Rect.fromLTRB(0, 0, width ?? size.width, height ?? size.height);
        final startAngle = dashLength * index;
        final sweepAngle = dashLength;
        canvas.drawArc(rect, startAngle, sweepAngle, false, dashLineBrush);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
