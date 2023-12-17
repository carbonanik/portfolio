import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/theme/selected_theme_provider.dart';
import 'package:portfolio/features/common/ui/widgets/menu/menu_item_style_2.dart';
import 'package:portfolio/theme/colors.dart';
import 'dart:html' as html;

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final sk = ref.watch(savedKeyProvider);

      return sk.map(
            data: (data) => InkWell(
              child: MenuItemS2(
                name: data.value ?? "theme",
                changeName: keyToSave(data.value ?? "theme") ?? "theme",
                onTap: (item) async {
                  final kt = keyToSave(data.value ?? "theme");
                  await saveTheme(kt ?? "theme");
                  html.window.location.reload();
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

  String? keyToSave(String key) {
    final keys = appColorsThemes.keys.toList();
    final index = keys.indexOf(key);
    final keyToSave = keys[(index + 1) % keys.length];
    return keyToSave;
  }
}
