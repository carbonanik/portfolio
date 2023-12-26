import 'package:flutter/cupertino.dart';
import 'package:portfolio/core/theme/colors.dart';
import 'package:portfolio/gen/fonts.gen.dart';

// ? Fonts
// const ibmPlexMono = "IBMPlexMono";
// const cabin = "Cabin";

// ? Font sizes
const fontSize_200 = 200.0;
const fontSize_100 = 100.0;
const fontSize_56 = 56.0;
const fontSize_26 = 26.0;
const fontSize_22 = 22.0;
const fontSize_18 = 18.0;

// ? Font weights
const fontWeight_800 = FontWeight.w800;
const fontWeight_600 = FontWeight.w600;
const fontWeight_400 = FontWeight.w400;

final titleOneTextStyle = TextStyle(
  // fontFamily: FontFamily.cabin,
  fontSize: fontSize_100,
  height: 1,
  fontWeight: fontWeight_800,
  color: appColors.foregroundColor,
);

final titleTwoTextStyle = TextStyle(
  fontFamily: FontFamily.iBMPlexMono,
  fontSize: fontSize_26,
  height: 1,
  fontWeight: fontWeight_400,
  color: appColors.accentColor,
);

final subtitleTextStyle = TextStyle(
  fontFamily: FontFamily.iBMPlexMono,
  fontSize: fontSize_18,
  height: 1,
  fontWeight: fontWeight_400,
  color: appColors.accentColor,
);

final paragraphTextStyle = TextStyle(
  // fontFamily: FontFamily.cabin,
  fontSize: fontSize_22,
  fontWeight: fontWeight_400,
  color: appColors.foregroundColorDark,
  letterSpacing: 1.2,
  wordSpacing: 1.2,
  height: 1.3,
);

final menuTextStyle = TextStyle(
  fontFamily: FontFamily.iBMPlexMono,
  fontSize: fontSize_22,
  fontWeight: fontWeight_600,
  color: appColors.foregroundColor,
);

final backgroundTextStyle = TextStyle(
  // fontFamily: FontFamily.cabin,
  fontSize: fontSize_200,
  fontWeight: fontWeight_400,
  color: appColors.backgroundColorLite.withOpacity(.3),
  height: .5,
);
