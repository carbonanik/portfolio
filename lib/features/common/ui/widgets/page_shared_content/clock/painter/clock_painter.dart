import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors.dart';

class ClockPainter extends CustomPainter {
  ClockPainter({
    required this.context,
  });

  final BuildContext context;

  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    final centerDotBrash = Paint()
      ..color = Theme.of(context).colorScheme.secondary
      ..style = PaintingStyle.fill;

    final secHandBrush = Paint()
      ..shader = RadialGradient(
        colors: [Theme.of(context).colorScheme.primary.withOpacity(.7), Theme.of(context).colorScheme.primary],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final minHandBrush = Paint()
      ..shader = RadialGradient(
        colors: [Theme.of(context).colorScheme.primary.withOpacity(.5), Theme.of(context).colorScheme.primary],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7;

    final hourHandBrush = Paint()
      ..shader = RadialGradient(
        colors: [Theme.of(context).colorScheme.primary.withOpacity(.3), Theme.of(context).colorScheme.primary],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    final dashLineBrush = Paint()
      ..color = Theme.of(context).colorScheme.primary.withOpacity(.1)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    var hourHandX = centerX + height / 5 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX + width / 5 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + height / 4 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + width / 4 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    final secHandX = centerX + height / 3 * cos(dateTime.second * 6 * pi / 180);
    final secHandY = centerY + width / 3 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, width / 15, centerDotBrash);

    const length = 12;

    for (int index = 0; index < length; index++) {
      final outerX = centerX + centerX * cos((index * 360 / length) * pi / 180);
      final outerY = centerY + centerY * sin((index * 360 / length) * pi / 180);

      final innerX = centerX + (centerX * .85) * cos((index * 360 / length) * pi / 180);
      final innerY = centerY + (centerY * .85) * sin((index * 360 / length) * pi / 180);

      canvas.drawLine(Offset(outerX, outerY), Offset(innerX, innerY), dashLineBrush);
    }
  }

  @override
  bool shouldRepaint(covariant ClockPainter oldDelegate) {
    return dateTime.second != oldDelegate.dateTime.second;
  }
}
