import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';

class CodeViewerLine extends StatelessWidget {
  final int lineNumber;
  final String line;
  final double fontSize;

  const CodeViewerLine({
    super.key,
    required this.line,
    required this.lineNumber,
    this.fontSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lineNumber % 2 == 0 ? appColors.backgroundColor.withOpacity(.7) : Colors.grey.withOpacity(.1),
      child: Row(
        children: [
          LineNumber(number: lineNumber, fontSize: fontSize),
          const SizedBox(width: 10),
          LineCode(
            line: line,
            fontSize: fontSize,
          )
        ],
      ),
    );
  }
}

class LineNumber extends StatelessWidget {
  final int number;
  final double fontSize;

  const LineNumber({
    required this.number,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        right: 8,
      ),
      color: appColors.backgroundColor,
      width: 35 + 16,
      child: Text(
        number.toString(),
        maxLines: 1,
        textAlign: TextAlign.end,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}

class LineCode extends StatelessWidget {
  final String line;
  final double fontSize;

  const LineCode({
    required this.line,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Text(
        line,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}

Widget highlightedPair(String line){
  return const Text.rich(
    TextSpan(
      text: 'Hello', // default text style
      children: <TextSpan>[
        TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
        TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

