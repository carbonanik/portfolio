
import 'package:flutter/material.dart';

class StepClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var x = step;

    while (x < size.width) {
      path.addRect(
        Rect.fromPoints(
          Offset(x, 0),
          Offset(x + step, size.height),
        ),
      );
      x += step * 2;
    }

    path.close();
    return path;
  }

  double get step => 2;

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
