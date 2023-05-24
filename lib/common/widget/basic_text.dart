import 'package:flutter/cupertino.dart';

import '../colors.dart';

class BasicText extends StatelessWidget {
  final String text;

  const BasicText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  const TextStyle(
        fontFamily: "Cabin",
            fontSize: 22, fontWeight: FontWeight.w400, color: textColorDim
            // height: 2
            ),

    );
  }
}
