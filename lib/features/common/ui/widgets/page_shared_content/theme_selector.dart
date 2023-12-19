import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/selected_theme_provider.dart';
import 'package:portfolio/features/common/ui/widgets/menu/menu_item_style_2.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:universal_html/html.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final sk = ref.watch(savedKeyProvider);

      return sk.map(
            data: (data) => InkWell(
              child: MenuItemTheme(
                name: data.value ?? "theme",
                next: (name) {
                  return keyToSave(name);
                },
                onTap: (name) async {
                  await saveTheme(name);
                  window.location.reload();
                },
              ),
            ),
            error: (error) {
              return const SizedBox();
            },
            loading: (l) {
              return const SizedBox();
            },
          ) ??
          const SizedBox();
    });
  }

  String keyToSave(String selectedKey) {
    final keys = appColorsThemes.keys.toList();
    final keysWithoutSelected = keys.where((element) => element != selectedKey).toList();
    final keyToSave = keysWithoutSelected.toList()[Random().nextInt(keysWithoutSelected.length)];
    return keyToSave;
  }
}
