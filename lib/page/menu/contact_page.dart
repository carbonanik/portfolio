import 'package:flutter/material.dart';
import 'package:portfolio/common/menu_content_page.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return const MenuContentPage(
      menuItem: "Contact",
      children: [],
    );
  }
}
