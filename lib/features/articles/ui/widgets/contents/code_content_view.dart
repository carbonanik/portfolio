import 'package:flutter/material.dart';
import 'package:highlight/languages/python.dart';
import 'package:portfolio/features/articles/models/article.dart';
import 'package:portfolio/features/articles/ui/widgets/code_editor.dart';

class CodeContentView extends StatelessWidget {
  const CodeContentView({
    required this.code,
    super.key,
  });

  final CodeContent code;

  @override
  Widget build(BuildContext context) {
    return CodeEditor(
      source: code.code,
      language: python,
      readOnly: true,
    );
  }
}
