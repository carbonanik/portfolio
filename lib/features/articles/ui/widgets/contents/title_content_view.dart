import 'package:flutter/material.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/features/articles/ui/styles.dart';

class TitleContentView extends StatelessWidget {
  const TitleContentView({required this.title, super.key});

  final TitleContent title;

  @override
  Widget build(BuildContext context) {
    return Text(title.text, style: bigTitleTwo);
  }
}