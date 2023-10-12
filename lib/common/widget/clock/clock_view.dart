
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        width: 300,
        // color: Colors.lightGreen,
        child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ));
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    final centerDotBrash = Paint()
      ..color = appColors.backgroundColorLite
      ..style = PaintingStyle.fill;

    final secHandBrush = Paint()
      ..shader = RadialGradient(
        colors: [appColors.accentColor.withOpacity(.7), appColors.accentColor],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final minHandBrush = Paint()
      ..shader = RadialGradient(
        colors: [appColors.accentColor.withOpacity(.5), appColors.accentColor],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7;

    final hourHandBrush = Paint()
      ..shader = RadialGradient(
        colors: [appColors.accentColor.withOpacity(.3), appColors.accentColor],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    final dashLineBrush = Paint()
      ..color = appColors.accentColor.withOpacity(.1)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    var hourHandX = centerX + 60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX + 60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    final secHandX = centerX + 100 * cos(dateTime.second * 6 * pi / 180);
    final secHandY = centerY + 100 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 20, centerDotBrash);

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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
