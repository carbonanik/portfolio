import 'package:flutter/cupertino.dart';
import 'package:portfolio/theme/colors.dart';

// ? Fonts
const ibmPlexMono = "IBMPlexMono";
const cabin = "Cabin";

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

const titleOneTextStyle = TextStyle(
  fontFamily: cabin,
  fontSize: fontSize_100,
  height: 1,
  fontWeight: fontWeight_800,
  color: foregroundColor,
);

const titleTwoTextStyle = TextStyle(
  fontFamily: ibmPlexMono,
  fontSize: fontSize_26,
  height: 1,
  fontWeight: fontWeight_400,
  color: accentColor,
);

const subtitleTextStyle = TextStyle(
  fontFamily: ibmPlexMono,
  fontSize: fontSize_18,
  height: 1,
  fontWeight: fontWeight_400,
  color: accentColor,
);

const paragraphTextStyle = TextStyle(
  fontFamily: cabin,
  fontSize: fontSize_22,
  fontWeight: fontWeight_400,
  color: foregroundColorDark,
  letterSpacing: 1.2,
  wordSpacing: 1.2,
  height: 1.3,
);

const menuTextStyle = TextStyle(
  fontFamily: ibmPlexMono,
  fontSize: fontSize_22,
  fontWeight: fontWeight_600,
  color: foregroundColor,
);

const backgroundTextStyle = TextStyle(
  fontFamily: cabin,
  fontSize: fontSize_200,
  fontWeight: fontWeight_400,
  color: backgroundTextColor,
  height: .5,
);
