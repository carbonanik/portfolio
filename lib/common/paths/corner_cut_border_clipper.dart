import 'package:flutter/material.dart';

class CornerCutBorderClipper extends CustomClipper<Path> {
  CornerCutBorderClipper({
    this.leftCut = true,
    this.cornerRadius = 80,
    this.width = 5,
  });

  final bool leftCut;
  final double cornerRadius;
  final double width;

  @override
  getClip(Size size) {
    double h = size.height;
    double w = size.width;



    Path path = Path();
    if (leftCut) {
      // path
      //   ..lineTo(cornerRadius, 0)
      //   ..lineTo(0, cornerRadius)
      //   ..lineTo(0, h)
      //   ..lineTo(w, h)
      //   ..lineTo(w, 0);

      path
        ..lineTo(cornerRadius, 0)
        ..lineTo(0, cornerRadius)
        ..lineTo(0, h)
        ..lineTo(w, h)
        ..lineTo(w, 0)
        ..lineTo(w - width, 0)
        ..lineTo(w - width, h - width)
        ..lineTo(width, h - width)
        ..lineTo(width, cornerRadius + width / 2)
        ..lineTo(cornerRadius + width / 2, width)
        ..lineTo(w - width, width)
        ..lineTo(w - width, 0);

    } else {
      // path
      //   ..lineTo(0, h)
      //   ..lineTo(0, h)
      //   ..lineTo(w, h)
      //   ..lineTo(w, cornerRadius)
      //   ..lineTo(w - cornerRadius, 0);
      path
        ..lineTo(0, h)
        ..lineTo(w, h)
        ..lineTo(w, cornerRadius)
        ..lineTo(w - cornerRadius, 0)
        ..lineTo(w - cornerRadius - width / 2, width)
        ..lineTo(w - width, cornerRadius + width / 2)
        ..lineTo(w - width, h - width)
        ..lineTo(width, h - width)
        ..lineTo(width, width)
        ..lineTo(w - cornerRadius, width)
        ..lineTo(w - cornerRadius, 0);
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
