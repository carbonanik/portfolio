
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';

class ColorSplashPainter extends CustomPainter {
  ColorSplashPainter({
    required this.value,
    this.cLength = 0.1,
  });

  final double value;
  final factor = 2000;
  final double cLength;

  // get sliced fraction of the animation value
  // 0-----from----------to-----------1
  //       .3-----------.6             - clamped
  //       .0-----------.3             - shifted
  double getShiftedFraction({
    required double from,
    required double to,
  }) {
    final clumped = (value).clamp(from, to);
    final shifted = clumped - from;
    return (shifted * factor).toInt().toDouble();
  }

  @override
  void paint(Canvas canvas, Size size) {
    // color circles starts at these time fragments of the animation
    const c1StartAt = 0.0;
    const c2StartAt = 0.1;
    const c3StartAt = 0.2;
    const c4StartAt = 0.3;

    // how long will the color circles last in the animation
    // const cLength = 0.1;

    // color circles ends at these time fragments of the animation
    final c1EndAt = c1StartAt + cLength;
    final c2EndAt = c2StartAt + cLength;
    final c3EndAt = c3StartAt + cLength;
    final c4EndAt = c4StartAt + cLength;

    const cStartsFrom = Offset.zero;

    final circleBrash1 = Paint()
      ..color = randomColor5
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: c1StartAt, to: c1EndAt) * 2;

    final circleBrash2 = Paint()
      ..color = randomColor6
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: c2StartAt, to: c2EndAt) * 2;

    final circleBrash3 = Paint()
      ..color = randomColor7
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: c3StartAt, to: c3EndAt) * 2;

    final circleBrash4 = Paint()
      ..color = randomColor8
      ..style = PaintingStyle.stroke
      ..strokeWidth = getShiftedFraction(from: c4StartAt, to: c4EndAt) * 2;

    canvas.drawCircle(
      cStartsFrom,
      circleBrash1.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: c1EndAt, to: 1)),
      circleBrash1,
    );
    canvas.drawCircle(
      cStartsFrom,
      circleBrash2.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: c2EndAt, to: 1)),
      circleBrash2,
    );
    canvas.drawCircle(
      cStartsFrom,
      circleBrash3.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: c3EndAt, to: 1)),
      circleBrash3,
    );
    canvas.drawCircle(
      cStartsFrom,
      circleBrash4.strokeWidth == 0 ? 0 : max(1, getShiftedFraction(from: c4EndAt, to: 1)),
      circleBrash4,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
