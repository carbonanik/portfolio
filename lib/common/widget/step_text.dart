import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';

class StepText extends StatelessWidget {
  const StepText({
    required this.text,
    required this.style,
    Key? key,
  }) : super(key: key);
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: <Color>[
            foregroundColor.withOpacity(.5),
            accentColor.withOpacity(.5),
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: ClipPath(
          clipper: StepClipper(), child: Text(text, style: style)),
    );
  }
}

class StepClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
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
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
