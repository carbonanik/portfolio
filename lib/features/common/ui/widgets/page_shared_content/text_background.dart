import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/theme_provider.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/core/theme/typography.dart';

class TextBackground extends ConsumerWidget {
  final VoidCallback? onTap;
  const TextBackground({
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return GestureDetector(
      onTap: onTap,
      child: Text(
        """
Hello World! Hello World! Hello World!\n
llo World! Hello World! Hello World! He\n
orld! Hello World! Hello World! Hello W\n
d! Hello World! Hello World! Hello Worl\n
lo World! Hello World! Hello World! Hel\n
World! Hello World! Hello World! Hello\n""",
        style: backgroundTextStyle(context).copyWith(
          color: theme.themeData.key == "canary"
              ? const Color(0xFFFDF1D2).withValues(alpha: .01)
              : null,
          fontSize: context.responsiveSize(
            desktop: backgroundTextStyle(context).fontSize!,
            tablet: backgroundTextStyle(context).fontSize!,
            mobile: backgroundTextStyle(context).fontSize! * .8,
          ),
        ),
        softWrap: false,
      ),
    );
  }
}
