import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/features/common/provider/blob_data_provider.dart';
import 'package:supercharged/supercharged.dart';

class MouseFollower extends StatelessWidget {
  const MouseFollower({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox(
        height: 400,
        width: 400,
        child: Center(
          child: Consumer(builder: (context, ref, child) {
            final blobHoverData = ref.watch(blobDataProvider);
            return Stack(
              alignment: Alignment.center,
              children: [
                AnimatedContainer(
                  duration: 400.milliseconds,
                  curve: Curves.ease,
                  height: blobHoverData.size.toDouble(),
                  width: blobHoverData.size.toDouble(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(blobHoverData.size / 2),
                    border:
                        blobHoverData.color == null ? Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(.2)) : null,
                    color: blobHoverData.color,
                  ),
                ),
                AnimatedSwitcher(
                  duration: 600.milliseconds,
                  switchInCurve: const HalfCurve(),
                  switchOutCurve: Curves.linear,
                  child: blobHoverData.child == null ? const SizedBox() : Center(child: blobHoverData.child!),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class HalfCurve extends Curve {
  const HalfCurve();

  @override
  double transformInternal(double t) {
    var t2 = (t - 0.5);
    if (t2 < 0) {
      return 0;
    } else {
      return t2 * 2;
    }
  }
}
