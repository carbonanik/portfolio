import 'package:flutter/material.dart';
import 'package:portfolio/common/menu_content_page.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MenuContentPage(
      showClock: false,
      menuItem: "Contact",
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        )
      ],
    );
  }
}
