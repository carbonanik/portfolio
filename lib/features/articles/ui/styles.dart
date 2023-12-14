import 'package:flutter/material.dart';

import '../../../theme/colors.dart';


const bigTitleTwo = TextStyle(
  fontFamily: "Cabin",
  fontSize: 48,
  fontWeight: FontWeight.w800,
  height: 1,
);

final subtitleStyle = TextStyle(
    fontFamily: "Cabin",
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1,
    color: appColors.accentColor);

final basicStyle = TextStyle(
  fontFamily: "Cabin",
  fontSize: 22,
  fontWeight: FontWeight.w400,
  color: appColors.foregroundColorDark,
  // height: 2
);

final inputUnderlineStyle = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: appColors.accentColor.withOpacity(.05)),
  ),
  focusedBorder:  UnderlineInputBorder(
    borderSide: BorderSide(color: appColors.accentColor),
  ),
);
