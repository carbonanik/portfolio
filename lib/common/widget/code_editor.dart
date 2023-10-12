import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/ocean.dart';
import 'package:flutter_highlight/themes/zenburn.dart';
import 'package:highlight/highlight.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/python.dart';
import 'package:portfolio/theme/colors.dart';

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
    Key? key,
  }) : super(key: key);

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
      patternMap: {
        "[()={}]" : customTheme['keyword']!
      }
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
    if (widget.readOnly == true){
      background = appColors.backgroundColor.withOpacity(0.8);
    } else {
      background = Colors.transparent;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: background
      ),
      child: CodeTheme(
        data: CodeThemeData(styles: customTheme),
        child: CodeField(
          controller: _codeController!,
          textStyle: TextStyle(fontSize: widget.fontSize),
          onChanged: widget.onChanged,
          // expands: true,
          readOnly: widget.readOnly,
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
  'root':
  const TextStyle(backgroundColor: Colors.transparent, color: Color(0xffdcdcdc)),
  'tag': TextStyle(color: Color(0xfff8f8f2)),
  'subst': TextStyle(color: Color(0xfff8f8f2)),
  'strong': TextStyle(color: Color(0xffa8a8a2), fontWeight: FontWeight.bold),
  'emphasis': TextStyle(color: Color(0xffa8a8a2), fontStyle: FontStyle.italic),
  'bullet': TextStyle(color: Color(0xffae81ff)),
  'quote': TextStyle(color: Color(0xffae81ff)),
  'number': TextStyle(color: Color(0xffae81ff)),
  'regexp': TextStyle(color: Color(0xffae81ff)),
  'literal': TextStyle(color: Color(0xffae81ff)),
  'link': TextStyle(color: Color(0xffae81ff)),
  'code': TextStyle(color: Color(0xffa6e22e)),
  'title': TextStyle(color: Color(0xffa6e22e)),
  'section': TextStyle(color: Color(0xffa6e22e)),
  'selector-class': TextStyle(color: Color(0xffa6e22e)),
  'keyword': TextStyle(color: Color(0xfff92672)),
  'selector-tag': TextStyle(color: Color(0xfff92672)),
  'name': TextStyle(color: Color(0xfff92672)),
  'attr': TextStyle(color: Color(0xfff92672)),
  'symbol': TextStyle(color: Color(0xff66d9ef)),
  'attribute': TextStyle(color: Color(0xff66d9ef)),
  'params': TextStyle(color: Color(0xfff8f8f2)),
  'string': TextStyle(color: Color(0xffe6db74)),
  'type': TextStyle(color: Color(0xffe6db74)),
  'built_in': TextStyle(color: Color(0xffe6db74)),
  'builtin-name': TextStyle(color: Color(0xffe6db74)),
  'selector-id': TextStyle(color: Color(0xffe6db74)),
  'selector-attr': TextStyle(color: Color(0xffe6db74)),
  'selector-pseudo': TextStyle(color: Color(0xffe6db74)),
  'addition': TextStyle(color: Color(0xffe6db74)),
  'variable': TextStyle(color: Color(0xffe6db74)),
  'template-variable': TextStyle(color: Color(0xffe6db74)),
  'comment': TextStyle(color: Color(0xff75715e)),
  'deletion': TextStyle(color: Color(0xff75715e)),
  'meta': TextStyle(color: Color(0xff75715e)),
};



// code text field example can be found
// https://github.com/BertrandBev/code_field/tree/master/example
// https://github.com/BertrandBev/dlox/tree/master/editor
