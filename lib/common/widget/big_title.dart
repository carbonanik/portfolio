import 'package:flutter/material.dart';


class BigTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool readOnly;

  const BigTitle({
    this.fontSize = BIG_TEXT_ONE,
    this.readOnly = true,
    required this.text,
    Key? key,
  }) : super(key: key);

  static const double BIG_TEXT_ONE = 100;
  static const double BIG_TEXT_TWO = 48;

  @override
  Widget build(BuildContext context) {
    final style =  TextStyle(
      fontFamily:
      "Cabin",
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        height: 1,

    );
    return Text(text, style: style);
  }
}
