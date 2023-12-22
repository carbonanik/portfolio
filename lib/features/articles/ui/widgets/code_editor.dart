import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/highlight.dart';
import 'package:portfolio/core/theme/selected_theme_provider.dart';
import 'package:portfolio/gen/fonts.gen.dart';
import 'package:portfolio/core/theme/colors.dart';

class CodeEditor extends StatefulWidget {
  final String source;
  final double fontSize;
  final bool readOnly;
  final Mode? language;
  final Function(String)? onChanged;

  const CodeEditor({
    required this.source,
    this.fontSize = 22,
    this.readOnly = true,
    this.language,
    this.onChanged,
    super.key,
  });

  @override
  State<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  CodeController? _codeController;

  @override
  void initState() {
    widget.fontSize;
    super.initState();
    _codeController = CodeController(
      text: widget.source,
      language: widget.language,
      patternMap: {"[()={}]": customTheme['keyword']!},
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late Color background;
    if (widget.readOnly == true) {
      background = appColors.backgroundColor.withOpacity(0.8);
    } else {
      background = Colors.transparent;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8)), color: background),
      child: CodeTheme(
        data: CodeThemeData(styles: customTheme),
        child: CodeField(
          controller: _codeController!,
          textStyle: TextStyle(fontSize: widget.fontSize),
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          lineNumbers: false,
          background: appColors.foregroundColorDark.withOpacity(.1),
          // lineNumberStyle: LineNumberStyle(
          //   textStyle: TextStyle(color: appColors.foregroundColor.withOpacity(0.5), fontFamily: FontFamily.iBMPlexMono),
          //   background: appColors.accentColor.withOpacity(.5),
          // ),
        ),
      ),
    );
  }

// TextSpan _lineNumberBuilder(int line, TextStyle? style)  {
//   if (line == 2) return TextSpan(text: "@", style: style);
//   return TextSpan(text: "$line", style: style);
// }
}

final customTheme = {
  'root': const TextStyle(
      backgroundColor: Colors.transparent, color: Color(0xffdcdcdc), fontFamily: FontFamily.iBMPlexMono),
  'tag': const TextStyle(color: Color(0xfff8f8f2), fontFamily: FontFamily.iBMPlexMono),
  'subst': const TextStyle(color: Color(0xfff8f8f2), fontFamily: FontFamily.iBMPlexMono),
  'strong': const TextStyle(color: Color(0xffa8a8a2), fontWeight: FontWeight.bold, fontFamily: FontFamily.iBMPlexMono),
  'emphasis':
      const TextStyle(color: Color(0xffa8a8a2), fontStyle: FontStyle.italic, fontFamily: FontFamily.iBMPlexMono),
  'bullet': const TextStyle(color: Color(0xffae81ff), fontFamily: FontFamily.iBMPlexMono),
  'quote': const TextStyle(color: Color(0xffae81ff), fontFamily: FontFamily.iBMPlexMono),
  'number': const TextStyle(color: Color(0xffae81ff), fontFamily: FontFamily.iBMPlexMono),
  'regexp': const TextStyle(color: Color(0xffae81ff), fontFamily: FontFamily.iBMPlexMono),
  'literal': const TextStyle(color: Color(0xffae81ff), fontFamily: FontFamily.iBMPlexMono),
  'link': const TextStyle(color: Color(0xffae81ff), fontFamily: FontFamily.iBMPlexMono),
  'code': const TextStyle(color: Color(0xffa6e22e), fontFamily: FontFamily.iBMPlexMono),
  'title': const TextStyle(color: Color(0xffa6e22e), fontFamily: FontFamily.iBMPlexMono),
  'section': const TextStyle(color: Color(0xffa6e22e), fontFamily: FontFamily.iBMPlexMono),
  'selector-class': const TextStyle(color: Color(0xffa6e22e), fontFamily: FontFamily.iBMPlexMono),
  'keyword': const TextStyle(color: Color(0xfff92672), fontFamily: FontFamily.iBMPlexMono),
  'selector-tag': const TextStyle(color: Color(0xfff92672), fontFamily: FontFamily.iBMPlexMono),
  'name': const TextStyle(color: Color(0xfff92672), fontFamily: FontFamily.iBMPlexMono),
  'attr': const TextStyle(color: Color(0xfff92672), fontFamily: FontFamily.iBMPlexMono),
  'symbol': const TextStyle(color: Color(0xff66d9ef), fontFamily: FontFamily.iBMPlexMono),
  'attribute': const TextStyle(color: Color(0xff66d9ef), fontFamily: FontFamily.iBMPlexMono),
  'params': const TextStyle(color: Color(0xfff8f8f2), fontFamily: FontFamily.iBMPlexMono),
  'string': const TextStyle(color: Color(0xffe6db74), fontFamily: FontFamily.iBMPlexMono),
  'type': const TextStyle(color: Color(0xffe6db74), fontFamily: FontFamily.iBMPlexMono),
  'built_in': const TextStyle(color: Color(0xffe6db74), fontFamily: FontFamily.iBMPlexMono),
  'builtin-name': const TextStyle(color: Color(0xffe6db74), fontFamily: FontFamily.iBMPlexMono),
  'selector-id': const TextStyle(color: Color(0xffe6db74), fontFamily: FontFamily.iBMPlexMono),
  'selector-attr': const TextStyle(color: Color(0xffe6db74), fontFamily: FontFamily.iBMPlexMono),
  'selector-pseudo': const TextStyle(color: Color(0xffe6db74), fontFamily: FontFamily.iBMPlexMono),
  'addition': const TextStyle(color: Color(0xffe6db74), fontFamily: FontFamily.iBMPlexMono),
  'variable': const TextStyle(color: Color(0xffe6db74), fontFamily: FontFamily.iBMPlexMono),
  'template-variable': const TextStyle(color: Color(0xffe6db74), fontFamily: FontFamily.iBMPlexMono),
  'comment': const TextStyle(color: Color(0xff75715e), fontFamily: FontFamily.iBMPlexMono),
  'deletion': const TextStyle(color: Color(0xff75715e), fontFamily: FontFamily.iBMPlexMono),
  'meta': const TextStyle(color: Color(0xff75715e), fontFamily: FontFamily.iBMPlexMono),
};

// code text field example can be found
// https://github.com/BertrandBev/code_field/tree/master/example
// https://github.com/BertrandBev/dlox/tree/master/editor
