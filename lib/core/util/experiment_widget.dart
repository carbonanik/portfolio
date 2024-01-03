import 'package:flutter/material.dart';
import 'package:portfolio/gen/assets.gen.dart';
import '../../features/common/ui/widgets/glitch_effect.dart';

class ExperimentWidget extends StatelessWidget {
  const ExperimentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlitchEffect(
        child: Image.asset(Assets.image.test.path),
      ),
    );
  }
}
