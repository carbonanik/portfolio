import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/features/articles/ui/styles.dart';

class TextContentView extends StatelessWidget {
  const TextContentView({required this.textContent, super.key});

  final TextContent textContent;

  @override
  Widget build(BuildContext context) {
    return Text(textContent.text, style: basicStyle);
  }
}
