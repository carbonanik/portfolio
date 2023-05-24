import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:portfolio/common/colors.dart';
import 'package:portfolio/common/widget/social_column.dart';
import 'package:portfolio/corner_cut_style_button.dart';
import 'package:portfolio/home_page.dart';
import 'package:portfolio/page/article_open_page.dart';
import 'package:portfolio/page/create_article_page.dart';
import 'package:portfolio/page/on_bording_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final controller = FruitColorizer({
    'orange': TextStyle(color: Colors.orange),
    'yellow': TextStyle(color: Colors.yellow),
    'red': TextStyle(color: Colors.red),
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: textColorLite,
              displayColor: textColorLite,
              fontFamily: "Cabin",
            ),
      ),
      home: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: controller,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Butt'),
            )
          ],
        ),
      ),
    );
  }
}

class FruitColorizer extends TextEditingController {
  final Map<String, TextStyle> mapping;
  final Pattern pattern;
  FruitColorizer(this.mapping)
      : pattern = RegExp(
          mapping.keys
              .map(
                (key) => RegExp.escape(key),
              )
              .join('|'),
        );

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    List<InlineSpan> children = [];

    text.splitMapJoin(
      pattern,
      onMatch: (Match match) {
        children.add(
          TextSpan(
            text: match[0],
            style: style?.merge(mapping[match[0]]),
          ),
        );
        return '';
      },
      onNonMatch: (text) {
        children.add(
          TextSpan(
            text: text,
            style: style,
          ),
        );
        return '';
      },
    );
    return TextSpan(style: style, children: children);
  }
}

class StyleSize {
  int start;
  int end;
  StyleSize({
    required this.start,
    required this.end,
  });
}

// class FruitColorizer extends TextEditingController {
//   StyledText data;
//   FruitColorizer({
//     required this.data,
//   });

//   @override
//   TextSpan buildTextSpan({
//     required BuildContext context,
//     TextStyle? style,
//     required bool withComposing,
//   }) {

//     return TextSpan(style: style, children: data.spans);
//   }
// }


// List<Map<String, dynamic>> t = [
//   {
//     "text": "hello world",
//     "styles": {
//       "color": {
//         "r": 0,
//         "g": 0,
//         "b": 255,
//       },
//       "bold": true,
//     },
//   },
//   {
//     "text": "hello world",
//     "styles": {
//       "color": {
//         "r": 255,
//         "g": 0,
//         "b": 0,
//         "a": 125,
//       },
//       "italic": true,
//     }
//   }
// ];

// StyledText dataToStyledText(List<Map<String, dynamic>> data) {
//   final List<TextNode> nodes = data.map(
//     (e) {
//       return TextNode(text: e['text'], style: mapToStyle(e));
//     },
//   ).toList();

//   return StyledText(
//     nodes: nodes,
//   );
// }

// class StyledText {
//   final List<TextNode> nodes;

//   StyledText({
//     required this.nodes,
//   });

//   String get text => nodes.map((e) => e.text).join();
//   List<TextSpan> get spans => nodes.map((e) => e.textSpan).toList();

//   addChar(String char, int index) {
//     nodes.last.addChar(char, index);
//   }

//   removeChar(int index) {
//     nodes.last.removeChar(index);
//   }
// }

// class TextNode {
//   String text;
//   TextStyle style;
//   TextNode({
//     required this.text,
//     required this.style,
//   });

//   TextSpan get textSpan => TextSpan(text: text, style: style);

//   addChar(String char, int index) {
//     text = text.substring(0, index) + char + text.substring(index);
//   }

//   removeChar(int index) {
//     text = text.substring(0, index) + text.substring(index + 1);
//   }
// }

// TextStyle mapToStyle(Map<String, dynamic> map) {
//   final color = getColor(map['styles']['color']);

//   final italic =
//       map['styles']['italic'] == true ? FontStyle.italic : FontStyle.normal;

//   final weight =
//       map['styles']['bold'] == true ? FontWeight.bold : FontWeight.normal;

//   final style = TextStyle(
//     color: color,
//     fontStyle: italic,
//     fontWeight: weight,
//   );

//   return style;
// }

// Color? getColor(Map<String, int>? code) {
//   if (code == null) return null;
//   return Color.fromARGB(code['a'] ?? 255, code['r']!, code['g']!, code['b']!);
// }
