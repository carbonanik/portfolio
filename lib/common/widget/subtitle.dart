import 'package:flutter/cupertino.dart';

import '../colors.dart';

class Subtitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const Subtitle({
    Key? key,
    required this.text,
    this.fontSize = 18,
    this.color = textColorDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          height: 1,
          color: color,
          fontFamily: "IBMPlexMono"
      ),
    );
  }
}
