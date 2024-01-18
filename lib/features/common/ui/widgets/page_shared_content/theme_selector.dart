import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/selected_theme_provider.dart';
import 'package:portfolio/core/theme/theme_provider.dart';
import 'package:portfolio/features/common/ui/widgets/menu/menu_item_style_2.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:universal_html/html.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final theme = ref.watch(themeProvider).themeData;
      final notifier = ref.read(themeProvider.notifier);

      return InkWell(
              child: MenuItemTheme(
                name: theme.key,
                next: (name) {
                  return notifier.nextRandomKey();
                },
                onTap: (name) async {
                  notifier.setThemeByKey(name);
                  // window.location.reload();
                },
              ),
            );
    });
  }
}
