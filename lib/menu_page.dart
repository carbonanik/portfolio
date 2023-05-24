import 'package:flutter/material.dart';

import 'common/colors.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            menuItem("Home", false, (v) {}),
            menuItem("About", false, (v) {}),
            menuItem("Service", false, (v) {}),
            menuItem("Portfolio", false, (v) {}),
            menuItem("Contact", false, (v) {}),
          ],
        ));
  }
}

menuItem(String title, bool hovered, Function(bool) setHovered) {
  return InkWell(
    onHover: ((value) => setHovered(value)),
    child: Center(
      child: Text(
        title,
        style: const TextStyle(
          color: textColorDark,
          fontSize: 100,
        ),
      ),
    ),
  );
}
