import 'package:flutter/material.dart';

import 'theme/colors.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors.backgroundColor,
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
  menuItem(String title, bool hovered, Function(bool) setHovered) {
    return InkWell(
      onHover: ((value) => setHovered(value)),
      child: Center(
        child: Text(
          title,
          style:  TextStyle(
            color: appColors.accentColor,
            fontSize: 100,
          ),
        ),
      ),
    );
  }
}


