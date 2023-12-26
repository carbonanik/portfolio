import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:portfolio/features/common/provider/glitch_provider.dart';
import 'package:portfolio/features/common/ui/widgets/ticking_builder.dart';

class GlitchEffect extends StatelessWidget {
  final Widget child;
  const GlitchEffect({
    required this.child,
    super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = Transform.translate(
        offset: const Offset(10, 0),
        child: child);
    return Consumer(
      builder: (context, ref, child) {
        final fragmentPrograms = ref.watch(fragmentProgramsProvider);
        return fragmentPrograms.map(
          data: (data) {
            return TickingBuilder(
              builder: (context, time) {
                return AnimatedSampler(
                      (image, size, canvas) {
                    const double overdrawPx = 30;
                    final shader = data.value.fragmentShader();
                    shader
                      ..setFloat(0, size.width)
                      ..setFloat(1, size.height)
                      ..setFloat(2, time)
                      ..setImageSampler(0, image);
                    Rect rect =
                    Rect.fromLTWH(-overdrawPx, -overdrawPx, size.width + overdrawPx, size.height + overdrawPx);
                    canvas.drawRect(rect, Paint()..shader = shader);
                  },
                  child: content,
                );
              },
            );
          },
          error: (error) => content,
          loading: (loading) => content,
        );
      },
    );
  }
}
