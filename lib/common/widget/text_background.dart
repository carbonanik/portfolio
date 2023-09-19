import 'package:flutter/cupertino.dart';
import 'package:portfolio/theme/typography.dart';

class TextBackground extends StatelessWidget {
  const TextBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      """
Hello World! Hello World! Hello World!\n
llo World! Hello World! Hello World! He\n
orld! Hello World! Hello World! Hello W\n
d! Hello World! Hello World! Hello Worl\n
lo World! Hello World! Hello World! Hel\n
World! Hello World! Hello World! Hello\n""",
      style: backgroundTextStyle,
      softWrap: false,
    );
  }
}
