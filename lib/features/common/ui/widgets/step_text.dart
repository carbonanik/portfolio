import 'package:flutter/material.dart';
import 'package:portfolio/features/common/paths/step_clipper.dart';
import 'package:portfolio/core/theme/colors.dart';

class StepText extends StatelessWidget {
  const StepText({
    required this.text,
    required this.style,
    super.key,
  });

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: <Color>[
            Theme.of(context).colorScheme.tertiary.withOpacity(.5),
            Theme.of(context).colorScheme.primary,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: ClipPath(
        clipper: StepClipper(),
        child: Text(text, style: style),
      ),
    );
  }
}
