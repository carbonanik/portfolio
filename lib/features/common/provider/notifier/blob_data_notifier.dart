import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/page_container.dart';

class BlobDataNotifier extends StateNotifier<BlobHoverData> {
  BlobDataNotifier() : super(const BlobHoverData.initial());

  void update({
    required Color color,
    required double size,
    Widget? child,
  }) {
    state = BlobHoverData(color: color, size: size, child: child);
  }

  void reset() {
    state = const BlobHoverData.initial();
  }
}
